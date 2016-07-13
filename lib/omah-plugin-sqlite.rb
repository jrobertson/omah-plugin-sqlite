#!/usr/bin/env ruby

# file: omah-plugin-sqlite.rb

require 'sqlite3'

class OmahPluginSqlite

  def initialize(settings: {}, variables: {})
    
    dbfile = settings[:dbfile]
    
    if File.exists? dbfile then
      
      @db = SQLite3::Database.new dbfile      
      
    else
      
      @db = SQLite3::Database.new dbfile
        
      # Create a database
      rows = @db.execute <<-SQL
  create table headers (
    id integer primary key autoincrement,
    from_x varchar(50),
    to_x varchar(50),
    subject varchar(140),
    date timestamp,
    filepath varchar(70)

  );
SQL
    
    end


  end

  def on_newmessage(h)

    @db.execute("INSERT INTO headers (from_x, to_x, subject, date, filepath) 
               VALUES (?, ?, ?, ?, ?)", %i(from to subject date html_filepath)\
               .map{|x| h[x]} )
  end

end
#!/usr/bin/env ruby

# file: omah-plugin-sqlite.rb

require 'sqlite3'
require 'rxfhelper'
require 'drb_sqlite'


class OmahPluginSqlite
  include RXFHelperModule

  def initialize(settings: {}, variables: {}, debug: false)
    
    dbfile = settings[:dbfile]
    
    sqlite = dbfile =~ /^sqlite:\/\// ? DRbSQLite : SQLite3::Database
    
    if FileX.exists? dbfile then
      
      @db = sqlite.new dbfile      
      
    else
      
      @db = sqlite.new dbfile
        
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

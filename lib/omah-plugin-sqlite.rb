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
    uid integer primary key,
    from_x varchar(50),
    to_x varchar(50),
    subject varchar(140),
    date timestamp

  );
SQL
    
    end


  end

  def on_newmessage(h)

    @db.execute("INSERT INTO headers (uid, from_x, to_x, subject, date) 
               VALUES (?, ?, ?, ?, ?)", [(Time.now.strftime("%y%m%d") + \
                  h[:uid]).to_i] + %i(from to subject date).map{|x| h[x]} )
  end

end
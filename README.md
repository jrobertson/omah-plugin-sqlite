# Introducing the Omah-plugin-sqlite gem

To test the Omah-plugin-sqlite gem I used dummy_omah. If it works with the dummy_omah gem then it will work with the Omah gem.

    require 'dummy_omah'
    require 'omah-plugin-sqlite'

    a = [
          ['001', 'info@twitter.com', 'somebody@jamesrobertson.eu',\
          'test 200','2015-may-26 08:55','just a quick test',\
          '<p>just a quick test</p>',[]]
        ]

    plugins = {
      sqlite: {active: true, dbfile: '/tmp/headers.db'}
    }
    dummy = DummyOmah.new(filepath: '/tmp', plugins: plugins)
    dummy.fetch_email a

In the above example it creates a file in the */tmp* directory called *headers.db*.

From the command-line, the command `sqlite3 headers.db "select * from headers"` returned the following:
<pre>1|info@twitter.com|somebody@jamesrobertson.eu|test 200|2015-may-26 08:55</pre>

## Resources

* Using SQLite3 http://www.jamesrobertson.eu/snippets/2015/nov/20/using-sqlite3.html
* omah-plugin-sqlite https://rubygems.org/gems/omah-plugin-sqlite

omahpluginsqlite sqlite omah plugin 

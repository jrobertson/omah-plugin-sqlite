Gem::Specification.new do |s|
  s.name = 'omah-plugin-sqlite'
  s.version = '0.1.5'
  s.summary = 'This Omah (Offline Mail Helper) gem plugin saves new email message headers to a SQLite database.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/omah-plugin-sqlite.rb']
  s.add_runtime_dependency('sqlite3', '~> 1.3', '>=1.3.11')
  s.signing_key = '../privatekeys/omah-plugin-sqlite.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/omah-plugin-sqlite'
end

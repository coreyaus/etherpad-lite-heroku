#!/usr/bin/env ruby
require 'fileutils'
require 'json'
require 'uri'

# Create settings hash add merge in the user-provided JSON.
database_uri = URI.parse(ENV['DATABASE_URL'])
settings = {
  dbType: database_uri.scheme,
  dbSettings: {
    user: database_uri.user,
    host: database_uri.host,
    password: database_uri.password,
    database: database_uri.path.sub(%r{^/}, '')
  },
  defaultPadText: '',
  editOnly: true,
  requireSession: true,
  title: '',
}.merge(JSON.parse(File.read(ENV.fetch('ETHERPAD_SETTINGS'))))

# Write the settings hash out as JSON.
File.open('./etherpad-lite/settings.json', 'w') { |f| f.write(settings.to_json) }

exec('./etherpad-lite/bin/run.sh')

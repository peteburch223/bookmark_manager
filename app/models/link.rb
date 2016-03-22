require 'data_mapper'
require 'dm-postgres-adapter'
require 'dotenv'


class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  property :date,   Date
end

Dotenv.load

if ENV['RACK_ENV'] == 'development'
  ENV['DATABASE'] = ENV['DATABASE_DEVT']
else
  ENV['DATABASE'] = ENV['DATABASE_TEST']
end

USER = ENV['USER']
PASSWORD = ENV['PASSWORD']
HOSTNAME = ENV['HOSTNAME']
DATABASE = ENV['DATABASE']


puts ENV['RACK_ENV']
puts ENV['DATABASE_DEVT']

puts "postgres://#{USER}:#{PASSWORD}@#{HOSTNAME}/#{DATABASE}"

DataMapper.setup(:default,"postgres://#{USER}:#{PASSWORD}@#{HOSTNAME}/#{DATABASE}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize.auto_upgrade!

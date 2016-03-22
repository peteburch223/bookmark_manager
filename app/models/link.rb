require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  property :date,   Date
end

puts "Database: bookmark_manager_#{ENV['RACK_ENV']}"

connection_string = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize.auto_upgrade!

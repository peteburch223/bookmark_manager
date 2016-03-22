require 'data_mapper'
require 'dm-postgres-adapter'

def data_mapper_setup
  puts "Database: bookmark_manager_#{ENV['RACK_ENV']}"
  connection_string = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
  DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
  # DataMapper::Logger.new($stdout, :debug)
end

def data_mapper_finalize
  DataMapper.finalize.auto_upgrade!
end

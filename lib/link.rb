require 'data_mapper'
require 'dm-postgres-adapter'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text
end

connection_string = "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
DataMapper.finalize
DataMapper.auto_upgrade!

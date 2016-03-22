require 'data_mapper'
require 'dm-postgres-adapter'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text
end

USER = 'simonglancy'
DB_NAME = 'bookmarks'
DataMapper.setup(:default, "postgres://#{USER}@localhost/#{DB_NAME}")
DataMapper.finalize
DataMapper.auto_upgrade!

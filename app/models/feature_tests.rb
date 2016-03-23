require 'data_mapper'
require 'dm-postgres-adapter'

USER = 'simonglancy'
DB_NAME = 'bookmarks'
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://#{USER}@localhost/#{DB_NAME}")
class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text
end

DataMapper.finalize
DataMapper.auto_migrate!

link = Link.create(title: 'BBC Sports', href: 'http://www.bbc.co.uk/sport')

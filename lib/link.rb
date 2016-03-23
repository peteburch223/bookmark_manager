require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'
require_relative 'tag'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text

  has n, :tags, through: Resource
end
data_mapper_setup

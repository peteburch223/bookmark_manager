require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'tag'
require_relative 'data_mapper_setup'

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  property :date,   Date

  has n, :tags, :through => Resource
end

data_mapper_setup

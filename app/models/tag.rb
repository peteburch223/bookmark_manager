require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'link'
require_relative 'data_mapper_setup'

class Tag
  include DataMapper::Resource

  property :id,   Serial
  property :tag,  String

  has n, :links, :through => Resource
end

data_mapper_setup

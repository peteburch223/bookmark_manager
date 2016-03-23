require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'
require_relative 'link'

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag, String

  belongs_to :link
end
data_mapper_setup

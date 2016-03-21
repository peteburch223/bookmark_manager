require 'data_mapper'
require 'dm-postgres-adapter'
require 'dotenv'

class Bookmark
  def initialize
    DataMapper.setup (:default, 'postgres://')
  end
end

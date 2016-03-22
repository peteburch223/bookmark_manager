require 'data_mapper'
require 'dm-postgres-adapter'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :href, Text
end

require_relative 'helpers/database_helper'

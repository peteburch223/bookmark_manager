
class Tag
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id, Serial
  property :name, Text, :lazy => false

end

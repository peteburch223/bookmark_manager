
class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, Text
  property :href, Text


end

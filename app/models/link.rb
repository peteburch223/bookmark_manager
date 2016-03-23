
class Link
  include DataMapper::Resource

  has n, :tags

  property :id, Serial
  property :title, Text
  property :href, Text


end

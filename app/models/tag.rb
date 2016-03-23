
class Tag
  include DataMapper::Resource

  belongs_to :link

  property :id, Serial
  property :name, Text

end

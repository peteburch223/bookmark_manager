
class Tag
  include DataMapper::Resource

  property :id, Serial
  property :name, Text

  # belongs_to :link
end

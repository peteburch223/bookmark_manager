class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :lazy => false
  property :password, String

end

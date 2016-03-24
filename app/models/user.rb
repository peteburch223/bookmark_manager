require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation

  validates_confirmation_of :password, :confirm => :password_confirmation

  def password
    @password
  end

  def password=(password)
    @password = password
    self.password_hash = Password.create(password)
  end

  property :id, Serial
  property :email, String, :lazy => false
  property :password_hash, String, :length => 128

end

#needed to generate the password hash
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  # validates_confirmation_of is a DataMapper method
  # provided especially for validating confirmation passwords!
  validates_confirmation_of :password
  property :id,     Serial
  property :email,  String
  # stores password and salt
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

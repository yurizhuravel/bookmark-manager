#needed to generate the password hash
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,     Serial
  property :email,  String
  # stores password and salt
  property :password_digest, String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end

class User < ActiveRecord::Base
  has_secure_password

  def self.authenticate email, password
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      false
    end
  end
end

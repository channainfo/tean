class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true

  def self.authenticate email, password
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      user
    else
      false
    end
  end
end

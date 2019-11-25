class User < ApplicationRecord

  has_many :tasks,dependent: :destroy
     has_secure_password
  validates :password, presence: true
  validates :email, presence: true, uniqueness: true, length: {maximum: 200},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
 before_validation { email.downcase! }
 def self.admins
  @users = User.all
@admins=0
  @users.each do |user|
    if user.admin?
      @admins += 1
    end
  end
  return @admins
end
end

class User < ApplicationRecord

  has_secure_password

  has_one :entry
  has_one :vote
  has_many :user_voters, class_name: "User", through: :votes

  validates :name, :password_digest, presence: true
  validates :email, uniqueness: true

end

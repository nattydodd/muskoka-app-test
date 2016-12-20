class User < ApplicationRecord

  has_secure_password

  has_one :entry

  validates :name, :password_digest, presence: true
  validates :email, uniqueness: true

end

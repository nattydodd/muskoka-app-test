class User < ApplicationRecord

  has_secure_password

  has_one :entry
  has_one :vote
  has_one :entry_vote, class_name: "Entry", through: :vote

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :terms_of_service, acceptance: true

end

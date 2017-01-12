class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :entry

  validates_uniqueness_of :voter_ip, :message => "already voted"
  validates_presence_of :email, :message => "you must provide your email address"


end

class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :entry

  validates_uniqueness_of :voter_ip, scope: :entry_id


end

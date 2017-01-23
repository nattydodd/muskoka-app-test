class Entry < ApplicationRecord

  include ActiveModel::Dirty

  belongs_to :user
  has_many :votes
  has_many :voter_users, class_name: "User", through: :votes

  mount_uploader :avatar, AvatarUploader

  after_update :clear_filtered_image

  validates :title, length: { maximum: 32 }
  validates :story, length: { maximum: 1500 }
  validates :title, presence: true
  validates :story, presence: true

  def clear_filtered_image
    if self.avatar_changed? && self.filter == true
      self.filter = nil
    end
  end


end

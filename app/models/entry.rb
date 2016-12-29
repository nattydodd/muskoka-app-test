class Entry < ApplicationRecord

  include ActiveModel::Dirty

  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  after_update :clear_filtered_image

  def clear_filtered_image
    if self.avatar_changed? && self.filter == true
      self.filter = nil
    end  
  end


end

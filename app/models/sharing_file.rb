class SharingFile < ActiveRecord::Base
  belongs_to :sharing
  mount_uploader :file, SharingFileUploader

  validates_presence_of :sharing_id, :folder, :file
end
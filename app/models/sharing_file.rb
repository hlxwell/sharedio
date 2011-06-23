class SharingFile < ActiveRecord::Base
  belongs_to :sharing
  mount_uploader :file, SharingFileUploader
end
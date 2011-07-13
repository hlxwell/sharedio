class SharingFile < ActiveRecord::Base
  belongs_to :sharing, :counter_cache => :uploaded_file_count
  mount_uploader :file, SharingFileUploader

  validates_presence_of :folder, :file

  after_create :notify_to_friends

  delegate :notify_to_friends, :to => :sharing
end
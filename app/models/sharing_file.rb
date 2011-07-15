class SharingFile < ActiveRecord::Base
  # since counter_cache won't invoke after update, I need to do manually.
  belongs_to :sharing #, :counter_cache => :uploaded_file_count
  mount_uploader :file, SharingFileUploader

  validates_presence_of :folder, :file

  after_create do
    sharing.increment!(:uploaded_file_count)
  end
end
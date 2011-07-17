class SharingFile < ActiveRecord::Base
  # since counter_cache won't invoke after update, I need to do manually.
  belongs_to :sharing #, :counter_cache => :uploaded_file_count
  has_one :user, :through => :sharing
  mount_uploader :file, SharingFileUploader

  validates_presence_of :file

  after_create do
    sharing.increment!(:uploaded_file_count)
  end

  delegate :url, :to => :file

  # 2010-04-16 21:32:12 From Michael:Some books/xx folder/xxx.pdf
  def download_store_path
    File.join("#{self.sharing.created_at.to_s(:db)} From #{self.user.email}", folder.to_s, file.file.filename)
  end

  # def to_json options = {}
  #   super options.merge!(methods => [:download_store_path, :url])
  # end

  def as_json options = nil
    self.attributes.merge!(
      :url => self.url,
      :download_store_path => self.download_store_path
    )
  end
end
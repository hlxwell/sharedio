class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :sharing
  has_many :sharing_files, :through => :sharing

  validates_presence_of :sharing_id
  validates_uniqueness_of :sharing_id, :scope => :user_id

  scope :viewed, where(:viewed => true)
  scope :unviewed, where(:viewed => false)

  def view!
    self.update_attribute :viewed, true
  end

  def as_json options = nil
    self.attributes.merge!(
      :sharing => self.sharing.attributes.merge!(:email => self.sharing.email),
      :sharing_files => self.sharing_files.includes(:user).map {|f| f.attributes.merge!(:url => f.url, :download_store_path => f.download_store_path) }
    )
  end
end
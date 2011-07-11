class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :sharing

  validates_presence_of :user_id, :sharing_id
  
  scope :viewed, where(:viewed => true)
  scope :unviewed, where(:unviewed => true)
  
  def view!
    self.update_attribute :viewed, true
  end
end

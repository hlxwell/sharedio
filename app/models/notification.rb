class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :sharing

  validates_presence_of :sharing_id
  
  scope :viewed, where(:viewed => true)
  scope :unviewed, where(:viewed => false)
  
  def view!
    self.update_attribute :viewed, true
  end
end

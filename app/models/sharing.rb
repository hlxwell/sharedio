class Sharing < ActiveRecord::Base
  belongs_to :user
  has_many :sharing_files, :dependent => :destroy
  has_many :sharing_users, :dependent => :destroy
  has_many :notifications, :dependent => :destroy

  accepts_nested_attributes_for :sharing_users, :allow_destroy => true
  accepts_nested_attributes_for :sharing_files, :allow_destroy => true

  validates_presence_of :user_id, :invitation_text

  after_save :notify_friends

  delegate :email, :to => :user

  def notify_friends
    return if total_file_count != uploaded_file_count # uploaded all the files

    self.sharing_users.each do |u|
      # if found the friend has the user account in system, send notification.
      if user = User.find_by_email(u.friend.email)
        self.notifications.create! :user => user
      end

      # send email to notify
      UserMailer.new_sharing(self, u.friend).deliver
    end
  end
end
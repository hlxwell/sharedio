class Sharing < ActiveRecord::Base
  belongs_to :user
  has_many :sharing_files, :dependent => :destroy
  has_many :sharing_users, :dependent => :destroy
  has_many :notifications, :dependent => :destroy

  accepts_nested_attributes_for :sharing_files
  accepts_nested_attributes_for :sharing_users

  validates_presence_of :user_id, :invitation_text

  def notify_to_friends
    self.sharing_users.each do |u|
      if user = User.find_by_email(u.friend.email)
        self.notifications.create! :user => user
      else
        # send email to notify
      end
    end
  end

  def to_json
    attrs = self.attributes
    attrs["sender"] = self.user.email
    attrs.to_json
  end
end
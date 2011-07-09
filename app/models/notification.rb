class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :sharing

  validates_presence_of :user_id, :sharing_id
end

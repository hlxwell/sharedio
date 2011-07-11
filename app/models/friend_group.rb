class FriendGroup < ActiveRecord::Base
  belongs_to :friend
  belongs_to :group
  
  validates_presence_of :user_id, :group_id
end
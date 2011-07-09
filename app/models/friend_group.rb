class FriendGroup < ActiveRecord::Base
  belongs_to :friend
  belongs_to :group
end
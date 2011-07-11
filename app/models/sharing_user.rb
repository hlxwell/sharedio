class SharingUser < ActiveRecord::Base
  belongs_to :sharing
  belongs_to :friend

  validates_presence_of :friend_id
end
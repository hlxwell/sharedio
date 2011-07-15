class SharingUser < ActiveRecord::Base
  belongs_to :sharing
  belongs_to :friend

  validates_presence_of :friend_id
  validates_uniqueness_of :friend_id, :scope => :sharing_id
end
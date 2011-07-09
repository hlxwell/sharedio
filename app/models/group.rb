class Group < ActiveRecord::Base
  belongs_to :user
  has_many :friend_groups
  has_many :friends, :through => :friend_groups

  validates_presence_of :user_id, :name
end
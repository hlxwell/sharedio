class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :friend_groups
  has_many :groups, :through => :friend_groups

  validates_presence_of :user_id, :name, :email
end

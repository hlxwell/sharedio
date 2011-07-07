class Sharing < ActiveRecord::Base
  belongs_to :user
  has_many :sharing_files
  has_many :sharing_users

  accepts_nested_attributes_for :sharing_files
  accepts_nested_attributes_for :sharing_users
  
  validates_presence_of :invitation_text
end
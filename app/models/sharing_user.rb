class SharingUser < ActiveRecord::Base
  belongs_to :sharing
  belongs_to :friend

  validates_presence_of :sharing_id, :folder, :file
end
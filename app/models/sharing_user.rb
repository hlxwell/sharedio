class SharingUser < ActiveRecord::Base
  belongs_to :sharing
  belongs_to :friend
end
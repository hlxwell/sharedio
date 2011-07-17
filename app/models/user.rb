class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable :token_authenticatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :sharings
  has_many :sharing_files, :through => :sharings
  has_many :friends
  has_many :groups
  has_many :notifications
  
  def used_space
    (self.sharing_files.all.sum { |f| f.file.size } / (1024.0 * 1024.0)).round(2)
  end
end
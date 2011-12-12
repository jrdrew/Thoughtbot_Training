class User < ActiveRecord::Base
  include Clearance::User
  has_many :updates
  has_many :friendships
  has_many :friends, through: :friendships
end

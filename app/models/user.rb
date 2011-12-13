class User < ActiveRecord::Base
  include Clearance::User
  has_many :updates
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :followings, class_name: "Friendship", foreign_key: :friend_id
  has_many :followers, through: :followings, source: :user
  
  def can_follow?(user)
    !self_and_friend_ids.include?(user.id)
  end
  
  def self_and_friend_ids
    friend_ids + [id]
  end
    
end

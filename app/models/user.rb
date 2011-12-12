class User < ActiveRecord::Base
  include Clearance::User
  has_many :updates
  has_many :friendships
  has_many :friends, through: :friendships
  
  def can_follow?(user)
    !self_and_friend_ids.include?(user.id)
  end
  
  private
  
  def self_and_friend_ids
    friend_ids + [id]
  end
    
end

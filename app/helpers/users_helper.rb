module UsersHelper
  def can_follow?(user)
    signed_in? && current_user.can_follow?(user)
  end
    
end
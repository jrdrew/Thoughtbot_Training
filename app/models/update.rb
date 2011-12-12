class Update < ActiveRecord::Base
  belongs_to :user
  belongs_to :content, polymorphic:true
  
  def self.most_recent
      order('created_at DESC')
  end
  
  
end

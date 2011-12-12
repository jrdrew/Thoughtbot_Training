class Post < ActiveRecord::Base
  
  has_one :update, as: :content
  
  validates :body, presence: true
  
  
end

class Photo < ActiveRecord::Base
  
  has_attached_file :attachment_one, :styles => { :medium => "300x300", :thumb => "200x200" }
  has_one :update, as: :content
end

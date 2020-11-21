class Meme < ApplicationRecord


  belongs_to :user, default: -> { Current.user }
 

 
# validates :image_url, presence: true
end

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, length: { maximum: 20 }
  validates :password, presence: true

  has_many :memes
   # dependent: :destroy

  
end

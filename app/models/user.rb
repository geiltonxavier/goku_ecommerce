class User < ApplicationRecord  
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :email, presence: true
end

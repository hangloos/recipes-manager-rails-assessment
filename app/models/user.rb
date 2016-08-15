class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    

    has_many :recipes
    has_many :ingredients, through: :recipes
    has_many :categories, through: :recipes
    has_many :comments, through: :recipes
end

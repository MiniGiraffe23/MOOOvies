class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :watchlists
  has_many :favorites
  has_many :ratings
  has_many :comments



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

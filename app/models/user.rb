class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :watchlists
  has_many :favorites
  has_many :ratings
  has_many :comments

  # validates :watchlists, uniqueness: {scope: :movie, message: "This is already on your watchlist!"}


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

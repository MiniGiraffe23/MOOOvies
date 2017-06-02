class Watchlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  # validates :user, uniqueness: {scope: :movie, message: "This movie is already on your watchlist!"}
end

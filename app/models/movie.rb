class Movie < ActiveRecord::Base
  # scope :top_three, ->{ order("average_rating DESC ").limit(3)}

  has_many :comments
  has_many :ratings
  has_many :favorites
  has_many :watchlists


  def average_rating
    rating = self.ratings.reduce(0) {|sum, rating| (sum + rating.spots)/self.ratings.count }
  end
end

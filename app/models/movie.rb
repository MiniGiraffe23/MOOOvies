class Movie < ActiveRecord::Base
  # scope :top_three, ->{ order("average_rating DESC ").limit(3)}

  has_many :comments
  has_many :ratings
  has_many :favorites
  has_many :watchlists


  # def average_rating
  #   rating = self.ratings.reduce(0) {|sum, rating| (sum + rating.spots)/self.ratings.count }
  # end

  def average_rating
    if self.ratings.count > 0
      total = self.ratings.reduce(0) {|sum, rating| (sum + rating.spots) }
      p total
     p rating = (total.to_f / self.ratings.count.to_f).round(1)



    else
      average_rating = 0
    end
  end

  def self.sort_movies_by(condition)
    p condition
    if condition == "Most Watchlisted"
    puts "were in model"
      Movie.all.sort_by {|movie| movie.watchlists.count}.reverse[0..2]
    elsif condition == "Most Favorited"
      Movie.all.sort_by {|movie| movie.favorites.count}.reverse[0..2]
    else
      Movie.all.to_a.sort_by(&:average_rating).reverse![0..2]
    end
  end

end

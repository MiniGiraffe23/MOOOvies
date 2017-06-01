class Movie < ActiveRecord::Base

  has_many :comments
  has_many :ratings
  has_many :favorites
  has_many :watchlists

end

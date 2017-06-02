class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validates :user, uniqueness: { scope: :movie }
end

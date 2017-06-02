class Rating < ActiveRecord::Base

  belongs_to :user
  belongs_to :movie

  validates :user, uniqueness: { scope: :movie }
  validates :spots, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end

class AddTmdidToMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :tmdid, :integer
  end
end

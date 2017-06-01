class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.text  :description
      t.date :release_date
      t.string :poster_url
      t.string :background_url
      t.string :trailer_url

      t.timestamps null: false
    end
  end
end

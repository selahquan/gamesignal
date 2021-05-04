class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :slug
      t.string :name
      t.string :background_image
      t.string :rating
      t.string :genre
      t.string :clips
      t.string :platform
      t.string :genres
      t.string :clip

      t.timestamps
    end
  end
end

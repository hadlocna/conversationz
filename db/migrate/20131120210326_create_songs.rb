class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :short_url, :null => false
      t.string :title, :null => false
      t.string :artist
      t.string :album
      t.integer :year

      t.timestamps
    end
  end
end

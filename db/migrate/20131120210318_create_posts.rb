class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.text :motivation
      t.integer :user_id, :null => false
      t.integer :song_id, :null => false

      t.timestamps
    end
  end
end

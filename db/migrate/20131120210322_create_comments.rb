class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.string :body
      t.integer :song_id
      t.integer :post_id, :null => false

      t.timestamps
    end
  end
end

class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.references :project, index: true

      t.timestamps
    end
  end
end

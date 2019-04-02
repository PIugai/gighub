class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :photo
      t.string :location
      t.integer :price
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end

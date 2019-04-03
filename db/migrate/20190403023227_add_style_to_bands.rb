class AddStyleToBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :style, :string
  end
end

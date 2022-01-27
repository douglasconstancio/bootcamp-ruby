class AddColorsToImage < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :detail_color, :string
    add_column :images, :primary_color, :string
    add_column :images, :secondary_color, :string
    add_column :images, :background_color, :string
  end
end

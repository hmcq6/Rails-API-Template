class CreateAddColorsToItems < ActiveRecord::Migration[5.1]
  def change
    create_table :add_colors_to_items do |t|
      t.references :colors, foreign_key: true

      t.timestamps
    end
  end
end

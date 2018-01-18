class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :alt_name
      t.references :brand
      t.references :type
      t.integer :year
      t.integer :product_number
      t.references :colors
      t.references :features
      t.string :bust
      t.string :length
      t.integer :price
      t.string :waist
      t.string :notes
      t.references :tags

      t.timestamps
    end
  end
end

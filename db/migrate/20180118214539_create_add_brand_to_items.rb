class CreateAddBrandToItems < ActiveRecord::Migration[5.1]
  def change
    create_table :add_brand_to_items do |t|
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end

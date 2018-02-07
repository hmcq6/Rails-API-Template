class CreateBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :brands do |t|
      t.text :name
      t.text :nickname
      t.references :image

      t.timestamps
    end
  end
end

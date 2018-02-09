class AddBrandToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :brand, foreign_key: true
  end
end

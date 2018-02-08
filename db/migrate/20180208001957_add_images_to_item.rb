class AddImagesToItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :images, foreign_key: true
  end
end

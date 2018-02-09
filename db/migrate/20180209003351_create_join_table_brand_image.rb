class CreateJoinTableBrandImage < ActiveRecord::Migration[5.1]
  def change
    create_join_table :brands, :images do |t|
      # t.index [:brand_id, :image_id]
      # t.index [:image_id, :brand_id]
    end
  end
end

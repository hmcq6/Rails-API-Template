class CreateJoinTableItemFeature < ActiveRecord::Migration[5.1]
  def change
    create_join_table :items, :features do |t|
      t.index [:item_id, :feature_id]
      t.index [:feature_id, :item_id]
    end
  end
end

class CreateAddTypeToItems < ActiveRecord::Migration[5.1]
  def change
    create_table :add_type_to_items do |t|
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end

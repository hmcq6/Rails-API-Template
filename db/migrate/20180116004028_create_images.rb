class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :file_name
      t.text :description

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, :precision => 8, :scale => 4
      t.references :category
      t.references :mark

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :mark_id
  end
end

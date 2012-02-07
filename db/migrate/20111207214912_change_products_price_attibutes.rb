class ChangeProductsPriceAttibutes < ActiveRecord::Migration
   def self.up
      change_column :products, :price, :decimal,  :precision => 8, :scale => 2
    end

    def self.down
      change_column :products, :price, :decimal, :precision => 8, :scale => 4
    end
end

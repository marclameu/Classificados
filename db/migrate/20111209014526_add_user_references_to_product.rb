class AddUserReferencesToProduct < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.references :user
    end
  end

  def self.down
    change_table :products do |t|
      t.remove :user_id
    end
  end

end

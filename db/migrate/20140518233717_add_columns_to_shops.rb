class AddColumnsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :password, :text
    add_column :shops, :insales_id, :integer
  end
end

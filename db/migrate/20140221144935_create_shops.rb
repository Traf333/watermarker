class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :domain
      t.string :name

      t.timestamps
    end
  end
end

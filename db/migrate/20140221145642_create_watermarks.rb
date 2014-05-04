class CreateWatermarks < ActiveRecord::Migration
  def change
    create_table :watermarks do |t|
      t.references :shop, index: true

      t.timestamps
    end
  end
end

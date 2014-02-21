class AddColumnToImages < ActiveRecord::Migration
  def change
    add_reference :images, :shop, index: true
  end
end

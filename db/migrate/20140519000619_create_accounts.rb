class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.text :insales_subdomain
      t.integer :insales_id
      t.text :password

      t.timestamps
    end
  end
end

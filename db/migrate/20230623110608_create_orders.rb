class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :name, null: false
      t.string :shopping_address, null: false
      t.string :postal_code, null: false
      t.integer :shopping_charge, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_methods, null: false
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :amount
      t.string :status
      t.jsonb :customer, null: false, default: '{}'
      t.jsonb :order_detail, null: false, default: '{}'
      t.timestamps
    end
    add_index :orders, :customer, using: :gin
  end
end

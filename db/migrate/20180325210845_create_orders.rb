class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :orderNum
      t.string :orderTotal
      t.string :category
      t.boolean :paymentStatus
      t.integer :receiptNum
      t.boolean :delivery
      t.date :deliveryDate
      t.string :orderStatus
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

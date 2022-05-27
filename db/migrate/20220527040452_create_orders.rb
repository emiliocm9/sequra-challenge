class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :merchant, foreign_key: true, null: false
      t.belongs_to :shopper, foreign_key: true, null: false
      t.monetize :amount, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end

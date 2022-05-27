class CreateDisbursements < ActiveRecord::Migration[6.1]
  def change
    create_table :disbursements do |t|
      t.belongs_to :order, foreign_key: true, null: false
      t.monetize :fee_amount, null: false

      t.timestamps
    end
  end
end

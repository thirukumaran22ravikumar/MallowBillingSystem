class CreateBills < ActiveRecord::Migration[8.0]
  def change
    create_table :bills do |t|
      t.string :customer_email
      t.float :total_amount
      t.float :paid_amount
      t.float :balance_amount

      t.timestamps
    end
  end
end

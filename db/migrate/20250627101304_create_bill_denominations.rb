class CreateBillDenominations < ActiveRecord::Migration[8.0]
  def change
    create_table :bill_denominations do |t|
      t.references :bill, null: false, foreign_key: true
      t.references :denomination, null: false, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end

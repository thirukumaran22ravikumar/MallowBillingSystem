class CreateDenominations < ActiveRecord::Migration[8.0]
  def change
    create_table :denominations do |t|
      t.integer :value
      t.integer :count

      t.timestamps
    end
  end
end








# p = Product.all ; b = Bill.all ;bt = BillItem.all ; denon = Denomination.all ;billD = BillDenomination.all

# puts p.inspect ; puts b.inspect ;puts bt.inspect ; puts denon.inspect ; puts billD.inspect 

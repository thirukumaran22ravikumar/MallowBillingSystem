class BillsController < ApplicationController
	def create
		
	  bill = Bill.create(customer_email: params[:customer_email], paid_amount: params[:paid_amount])

	  total = 0
	  params[:products].each do |product_data|
	    product = Product.find_by(product_id: product_data[:product_id])
	    quantity = product_data[:quantity].to_i
	    price_with_tax = (product.price * quantity) * (1 + product.tax_percentage / 100)

	    BillItem.create(bill: bill, product: product, quantity: quantity, price_with_tax: price_with_tax)

	    product.update(available_stocks: product.available_stocks - quantity)
	    total += price_with_tax
	  end

	  bill.update(total_amount: total, balance_amount: bill.paid_amount - total)

	  calculate_denominations(bill)

	  # Send invoice email (later step)
	  BillMailer.with(bill: bill).invoice_email.deliver_later

	  redirect_to bill_path(bill)
	end


	def calculate_denominations(bill)
	  balance = bill.balance_amount.to_i

	  Denomination.order(value: :desc).each do |denomination|
	    next if balance <= 0

	    count_needed = balance / denomination.value
	    count_to_give = [count_needed, denomination.count].min

	    if count_to_give > 0
	      BillDenomination.create(bill: bill, denomination: denomination, count: count_to_give)
	      denomination.update(count: denomination.count - count_to_give)
	      balance -= count_to_give * denomination.value
	    end
	  end
	end

	def show
	  @bill = Bill.find(params[:id])
	end


	def history
	  @bills = Bill.where(customer_email: params[:email])
	end

	# def history
	#   if params[:email].present?
	#     @customer_email = params[:email]
	#     @bills = Bill.where(customer_email: @customer_email)
	#   else
	#     @bills = []
	#   end
	# end




end

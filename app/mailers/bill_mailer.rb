class BillMailer < ApplicationMailer
  default from: 'shop@example.com'

  def invoice_email
    @bill = params[:bill]
    mail(to: @bill.customer_email, subject: 'Your Purchase Invoice')
  end
end

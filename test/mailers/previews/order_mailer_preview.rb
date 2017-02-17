class OrderMailerPreview < ActionMailer::Preview
  def receipt_email
    OrderMailer.receipt_email(Order.last)
  end
end
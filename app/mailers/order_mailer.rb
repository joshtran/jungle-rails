class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt_email (user)
    @order = order
    mail(to: @order.email, subject: @order.id)
end

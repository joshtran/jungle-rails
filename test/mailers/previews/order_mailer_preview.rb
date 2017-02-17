class OrderMailerPreview < ActionMailer::Preview
  def receipt_email
    UserMailer.welcome_email(User.first)
  end
end
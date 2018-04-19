class UserMailer < ApplicationMailer
  default :from => "notifications@myapp.com"

  def reset_password_email(user)
    @user = user
    mail(:to => user.email, :subject => "Reset password")
  end
end

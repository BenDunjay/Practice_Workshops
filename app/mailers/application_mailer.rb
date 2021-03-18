class ApplicationMailer < ActionMailer::Base
  default from: "bendunjay@outlook.com"
  layout "mailer"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
end

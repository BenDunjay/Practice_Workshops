class ApplicationMailer < ActionMailer::Base
  default from: "bendunjay@outlook.com"
  layout "mailer"

  def registration_confirmation(user)
    byebug
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation", body: "something")
    byebug
  end
end

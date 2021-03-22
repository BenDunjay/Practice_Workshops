# frozen_string_literal: true

# comment
class ApplicationMailer < ActionMailer::Base
  default from: "bendunjay@outlook.com"
  layout "mailer"

  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.name} <#{user.email}>", subject: "Registration Confirmation", body: "Confirmation token #{user.confirmation_token}")
  end
end

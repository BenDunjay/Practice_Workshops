class RegistrationMailer < ApplicationMailer
  def registration_confirmation(user)
    @user = user
    mail(to: "#{user.name} <#{user.email}>", subject: "Registration Confirmation", body: "Confirmation token #{user.confirmation_token}")
  end
end

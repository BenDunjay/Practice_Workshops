# frozen_string_literal: true

# comment
class ApplicationMailer < ActionMailer::Base
  default from: "random@outlook.com"
  layout "mailer"
end

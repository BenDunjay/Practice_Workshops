# frozen_string_literal: true

require "securerandom"

module GenerateToken
  extend ActiveSupport::Concern

  def generate_token(type = :base64)
    loop do
      token = new_token(type)
      break token unless self.class.exists?(token: token)
    end
  end

  private

  def new_token(type)
    case type.to_sym
    when :base64
      SecureRandom.urlsafe_base64(15).tr("LI00", "sxyz")
    end
  end
end

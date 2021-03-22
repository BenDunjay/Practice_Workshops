# frozen_string_literal: true

# comment
class User < ApplicationRecord
  # include GenerateToken

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
  before_save :downcase_email
  before_create :generate_confirmation_instructions
  # validates :password, current_password_matches: { message: "doesn't match" },
  #  if: -> { password.present? }

  private

  def downcase_email
    byebug
    self.email = email.delete(" ").downcase
  end

  def generate_confirmation_instructions
    create_confirmation_token
    self.confirmation_sent_at = Time.now.utc
  end

  def create_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64(15).tr("LI00", "sxyz") if confirmation_token.blank?
  end
end

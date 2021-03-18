class User < ApplicationRecord
  #   include GenerateToken

  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /@/
  before_save :downcase_email
  before_create :generate_confirmation_instructions

  private

  def downcase_email
    self.email = self.email.delete(" ").downcase
  end

  def generate_confirmation_instructions
    create_confirmation_token
    self.confirmation_sent_at = Time.now.utc
  end

  def create_confirmation_token
    byebug
    if self.confirmation_token.blank?
      self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    end
  end
end

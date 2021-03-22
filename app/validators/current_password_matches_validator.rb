class CurrentPasswordMatchesValidator < BaseEachValidator
  def validate_each(record, attribute, _value)
    current_password = record.current_password
    encrypted_password = record.password_digest
    return if current_password_matches?(current_password, encrypted_password)

    add_password_error(record, attribute, current_password)
  end

  private

  def current_password_matches?(current_password, encrypted_password)
    BCrypt::Password.new(encrypted_password) == current_password
  end

  def add_password_error(record, attribute, current_password)
    add_error(record, current_password.present? ? :current_password : attribute)
  end
end

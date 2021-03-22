class BaseEachValidator < ActiveModel::EachValidator
  private

  def add_error(record, attr, msg = message, options = {})
    record.errors.add attr, msg, options
  end

  def message
    options[:message] || default_message
  end

  def default_message
    self.class.name.gsub(/Validator\Z/, "").underscore.to_sym
  end
end

class EmailFormatValidator < ActiveModel::Validator
  EMAIL_REGEXP = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate(record)
    if options[:fields].any? { |field| !(record.send(field) =~ EMAIL_REGEXP) }
      record.errors[:email] << 'is invalid'
    end
  end
end

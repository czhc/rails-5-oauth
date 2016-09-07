module Emailable
  extend ActiveSupport::Concern
  included do
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates_with EmailFormatValidator, fields: [:email]
  end
end

class User < ApplicationRecord
  include Emailable
  # include RoleConcerns
  has_secure_password

  before_create :generate_api_access_token

  def log_out_all
    Doorkeeper::AccessToken.where(resource_owner_id: self.id).update_all(revoked_at: Time.current)
  end

  def generate_api_access_token
    self.api_access_token = loop do
      token = SecureRandom.base64.tr('+/=', 'kdm')
      break token unless User.exists?(api_access_token: token)
    end
  end
end

class ApplicationController < ActionController::API
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization
  # before_action :authenticate
  before_action :cors_preflight_check
  after_action :cors_set_access_control_headers

  protected

  # def authenticate
  #   # authenticate_with_http_token do |token, options|
  #     Rails.logger.debug "DEBUG http token: #{token.inspect}"

  #     if doorkeeper_token
  #       Rails.logger.debug "DEBUG doorkeeper_token: #{doorkeeper_token.inspect}"
  #       @current_user = User.find(doorkeeper_token.resource_owner_id)
  #       session[:user_id] = @current_user&.id
  #     end
  #   # end

  #   return if @current_user

  #   return render_unauthorized

  #   # authenticate_with_http_token do |token, options|
  #   #   @current_user = User.find_by(api_access_token: token)
  #   #   session[:user_id] = @current_user&.id
  #   # end
  # end

  def current_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  # def render_unauthorized(realm = "Application")
  #   self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
  #   render json: { errors: ['User not authenticated']}, status: :unauthorized
  # end

  # def errors_json(messages)
  #   { errors: [*messages] }
  # end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render text: '', content_type: 'text/plain'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

end

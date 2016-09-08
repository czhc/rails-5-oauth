class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :doorkeeper_authorize_api, only: :create

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def sync
    render json: current_resource_owner.as_json(except: :password_digest), status: 200
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

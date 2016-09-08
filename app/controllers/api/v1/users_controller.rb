class Api::V1::UsersController < ApplicationController
  # skip_before_action :doorkeeper_authorize!#, only: [:create]
  # skip_before_action :authenticate, only: [:create]
  # skip_authorization_check

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { error: 'Bad arguments'}, status: 403
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

class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize, only: [:create, :profile]

  def index
    render json: User.all, each_serializer: UserIndexSerializer
  end

  def show
    render json: User.find(params[:id])
  end

  def profile
    # Find display user by username
    # if not found, redirect to not found page
    debugger
  end

  def create
    # user1 = User.new(user_params)
    # debugger
    user = User.create!(user_params)
    session[:user_id] = user.id
    render json: user, status: :created
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation, :name, :bio, :location, :fb_url, :sc_url, :tw_url)
  end
end

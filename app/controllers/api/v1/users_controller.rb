class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all, each_serializer: UserIndexSerializer
  end 

  def show
    render json: User.find(params[:id])
  end

  def profile
    # returns the user data of the current user
  end
end

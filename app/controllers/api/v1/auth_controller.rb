class Api::V1::AuthController < ApplicationController
  skip_before_action :authorize, only: :login

  def login
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user
    else 
      render json: { errors: ["Invalid username or password"] }, status: :unauthorized
    end
  end

  def me
    render json: @current_user
  end

  def logout
    session.delete(:user_id)
    head :no_content
  end
end

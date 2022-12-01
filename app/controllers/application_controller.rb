class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  before_action :authorize
  
  private

  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  end

  def render_not_found(err)
    render json: {error: err}, status: 404
  end

  def render_invalid(err)
    render json: {error: err.record.errors.full_messages}, status: 422
  end
end

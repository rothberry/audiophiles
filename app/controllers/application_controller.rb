class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  private

  def render_not_found(err)
    render json: {error: err}, status: 404
  end

  def render_invalid(err)
    render json: {error: err.record.errors.full_messages}, status: 422
  end
end

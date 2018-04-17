class ApplicationController < ActionController::API
  # include ExceptionHandler
  # protect_from_forgery with: :exception
  def authenticate_request!
    @current_user = User.find_by(id: request.headers[:token])
    if @current_user.nil?
      render json: {
          status: "missing token"
      }
    end
  end
end

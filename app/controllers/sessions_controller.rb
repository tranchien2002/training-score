class SessionsController < ApplicationController
  def login
    user = AuthenticateUser.new(params[:code], params[:password])
    auth_token = user.call
    if auth_token.nil?
      render json: {status: :fail}
    else
      render json: {token: user.id, role: user.role}, status: :ok
    end

  end
end

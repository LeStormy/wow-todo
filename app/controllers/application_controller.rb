class ApplicationController < ActionController::Base
  before_action :authenticate_user, except: [:login, :index]

  def login
    password = params[:password]
    if password == Rails.application.credentials.dig(:password)
      cookies.signed[:session_id] = Rails.application.credentials.dig(:token)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def authenticate_user
    if authorization_token != Rails.application.credentials.dig(:token)
      redirect_to root_path
    end
  end

  def authorization_token
    cookies.signed[:session_id]
  end
end

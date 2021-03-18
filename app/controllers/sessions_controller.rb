class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    byebug
    if valid_session?(user)
      render json: user
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  attr_reader :user

  def valid_session?(user)
    if user && user.authenticate(user_login_params[:password])
      session[:user_id] = user.id     
    else 
        ValidationError => e
    end
  end
end

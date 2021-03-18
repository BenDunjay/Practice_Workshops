class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: user_login_params[:email]).first
    if valid_session?(user)
      byebug
      render json: { message: "Successfully signed in." }, status: :created
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
      #   ValidationError => e
    end
  end

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end

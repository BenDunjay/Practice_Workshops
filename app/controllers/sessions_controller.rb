# frozen_string_literal: true

# comment
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(email: user_login_params[:email]).first
    if valid_session?(user)
      render json: { message: 'Successfully signed in.' }, status: :created
    else
      render json: { message: 'invalid name or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  attr_reader :user

  def valid_session?(user)
    session[:user_id] = user.id if user&.authenticate(user_login_params[:password])
  end

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end

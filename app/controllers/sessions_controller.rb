# frozen_string_literal: true

# comment
class SessionsController < ApplicationController
  def new; end

  def create
    user = User.where(email: user_login_params[:email]).first
    if valid_session?(user)
      byebug
      render json: { message: "Successfully signed in." }, status: :created
    else
      render json: { message: "invalid name or password" }, status: :unauthorized
      # error method here to render different failures
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  attr_reader :user

  def valid_session?(user)
    byebug
    session[:user_id] = user.id if user&.authenticate(user_login_params[:password])
    # if user.confirmed_at
    #   sign_in user
    # else
    #   render json: { message: "Please activate your account by following the
    #     instructions in the account confirmation email you received to proceed" }, status: :unauthorized
    # error method here to render different failures
    # end
  end

  def user_login_params
    params.require(:user).permit(:email, :password)
  end
end

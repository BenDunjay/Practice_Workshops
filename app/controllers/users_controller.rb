# frozen_string_literal: true

# comment
class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      RegistrationMailer.registration_confirmation(user).deliver
      render json: { status: "User created successfully, please confirm your email address to continue." },
             status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end

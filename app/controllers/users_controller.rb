# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if user.save
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      render json: session.login
    else
      render json: { error: user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end

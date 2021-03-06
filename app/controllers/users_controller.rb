# frozen_string_literal: true

class UsersController < ApplicationController
  wrap_parameters :user, include: %i[email password password_confirmation]

  def create
    @user = User.new(user_params)
    if @user.save!
    else
      render json: { error: @user.errors.full_messages.join(' ') }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

class Api::UsersController < ApplicationController
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      phone_number: params[:phone_number],
      image: params[:image]
    )

    if @user.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end
end
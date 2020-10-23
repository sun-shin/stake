class Api::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    render "show.json.jb"
  end
  
  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
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

  def update
    @user = User.find(params[:id])

    @user.first_name = params[:first_name] || @user.first_name
    @user.last_name = params[:last_name] || @user.last_name
    @user.email = params[:email] || @user.email
    # @user.password = params[:password] || @user.password
    # @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.phone_number = params[:phone_number] || @user.phone_number
    @user.image = params[:image] || @user.image

    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Account has been destroyed"}
  end
end

class Api::UsersController < ApplicationController
  
  before_action :authenticate_user, except: [:show, :create]

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
    )
    if @user.save 
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    response = ""
    if params[:image]
      response = Cloudinary::Uploader.upload(params[:image])
    end
    @user = User.find(params[:id])
    if @user == current_user
      @user.first_name = params[:first_name] || @user.first_name
      @user.last_name = params[:last_name] || @user.last_name
      @user.email = params[:email] || @user.email
      # if params[:password]
      #   @user.password = params[:password] 
      #   @user.password_confirmation = params[:password_confirmation] 
      # end
      @user.phone_number = params[:phone_number] || @user.phone_number
      @user.image = response["secure_url"] || @user.image

      if @user.save
        render "show.json.jb"
      else
        render json: { errors: @user.errors.full_messages }, status: 422
      end
    else
      render json: {message: "You can only edit your own information!"}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "Account has been destroyed"}
  end
end

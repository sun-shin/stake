class Api::EventUsersController < ApplicationController

  before_action :authenticate_user
  #authenticate create,update, destroy for current_user

  def index
    @event_users = EventUser.all
    render "index.json.jb"
  end

  def create
    @event_user = EventUser.new(
      user_id: params[:user_id],
      event_id: params[:event_id]
    )
    
    if @event_user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full.messages }, status: 422
    end
  end

  def destroy 
    event_user = EventUser.find(params[:id])
    event_user.destroy
    render json: {message: "You are no longer attending this event."}
  end
end

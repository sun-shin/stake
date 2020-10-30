class Api::EventUsersController < ApplicationController

  before_action :authenticate_user

  def index
    @event_users = EventUser.all
    render "index.json.jb"
  end
#attend event
  def create
    @event_user = EventUser.new(
      user_id: current_user.id,
      event_id: params[:event_id]
    )
    
    if @event_user.save
      render "show.json.jb"
    else
      render json: { errors: @event_user.errors.full_messages }, status: 422
    end
  end
#unattend event
  def destroy 
    event_user = EventUser.find(params[:id])
    if event_user.user_id == current_user.id
      event_user.destroy
      render json: {message: "You are no longer attending this event."}
    else
      render json: {message: "You can only unattend your attending events"}, status: :unauthorized
    end
  end
end

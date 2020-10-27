class Api::EventsController < ApplicationController
  
  before_action :authenticate_user, except: [:index, :show]
  #authenticate update, destroy if user_id = current_user
  def index
    @events = Event.all 
    render "index.json.jb"
  end

  def show
    if current_user
      @event = Event.find(params[:id])
      render "show.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    @event = Event.new(
      title: params[:title],
      user_id: current_user.id,
      description: params[:description],
      address: params[:address],
      attendee_limit: params[:attendee_limit],
      date: params[:date]
    )
    if @event.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @event.errors.full_messages }, status: :bad_request
    end
  end
  
  def update
    @event = Event.find(params[:id])

    @event.title = params[:title] || @event.title
    @event.user_id = params[:user_id] || @event.user_id
    @event.description = params[:description] || @event.description
    @event.address = params[:address] || @event.address
    @event.attendee_limit = params[:attendee_limit] || @event.attendee_limit
    @event.date = params[:date] || @event.date

    if @event.user_id == current_user.id 
      if @event.save
        render "show.json.jb"
      else
        render json: { errors: @event.errors.full_messages }, status: :unprocessible_entity
      end
    else 
      render json: { status: :unauthorized }
    end
  end
# if user_id = current_user
  def destroy
    event = Event.find(params[:id])
    if event.user_id == current_user.id 
      event.destroy
      render json: {message: "Event has been destroyed"}
    else 
      render json: { status: :unauthorized }
    end
  end
end

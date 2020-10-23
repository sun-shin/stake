class Api::EventsController < ApplicationController
  def index
    @events = Event.all 
    render "index.json.jb"
  end

  def show
    @event = Event.find(params[:id])
    render "show.json.jb"
  end

  def create
    @event = Event.new(
      title: params[:title],
      user_id: params[:user_id],
      description: params[:description],
      address: params[:address],
      attendee_limit: params[:attendee_limit],
      date: params[:date]
    )
    if @event.save
      render "show.json.jb", status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def edit
    @event = Event.find(params[:id])

    @event.title = params[:title] || @event.title
    @event.user_id = params[:user_id] || @event.user_id
    @event.description = params[:description] || @event.description
    @event.address = params[:address] || @event.address
    @event.attendee_limit = params[:attendee_limit] || @event.attendee_limit
    @event.date = params[:date] || @event.date

    if @event.save
      render "show.json.jb"
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    render json: {message: "Event has been destroyed"}
  end
end

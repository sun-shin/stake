class Api::EventsController < ApplicationController
  
  before_action :authenticate_user, except: [:show, :index]

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
      user_id: current_user.id,
      description: params[:description],
      address: params[:address],
      attendee_limit: params[:attendee_limit],
      event_start: params[:event_start],
      duration: params[:duration]
    )
    if @event.save
      # params[:tag_ids] = [2, 5, 9]
      params[:tag_ids].each do |tag_id|
        EventTag.create(
          event_id: @event.id,
          tag_id: tag_id
        )
      end
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
    @event.event_start = params[:event_start] || @event.event_start
    @event.duration = params[:duration] || @event.duration

    if @event.user_id == current_user.id 
      if @event.save
        @event.event_tags.destroy_all
        params[:tag_ids].each do |tag_id|
          EventTag.create(
            event_id: @event.id,
            tag_id: tag_id
          )
        end
        render "show.json.jb"
      else
        render json: { errors: @event.errors.full_messages }, status: :bad_request
      end
    else 
      render json: { status: :unauthorized }
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.user_id == current_user.id 
      event.destroy
      render json: {message: "Event has been destroyed"}
    else 
      render json: { status: :unauthorized }
    end
  end

  def attendingindex
    
  end
end

class Api::EventTagsController < ApplicationController
  
  before_action :authenticate_user
  
  def create
    @event_tag = EventTag.new(
      event_id: params[:event_id],
      tag_id: params[:tag_id]
    )

    if @event_tag.event.user_id == current_user.id
      if @event_tag.save
        render "show.json.jb"
      else
        render json: { errors: @event_tag.errors.full_messages }
      end
    else
      render json: { message: "Users may only create tags for their created events" }, status: :unauthorized
    end
  end
  
  
  def update 
    @event_tag = EventTag.find(params[:id])
    if @event_tag.event.user_id == current_user.id
      @event_tag.tag_id = params[:tag_id] || @event_tag.tag_id
      
      render "show.json.jb"
    else
      render json: { message: "Users may only change tags of their own events" }, status: :unauthorized
    end
  end

  def destroy 
    event_tag = EventTag.find(params[:id])
    if event_tag.event.user_id == current_user.id
      event_tag.destroy
      render json: {message: "Event tag has been destroyed"}
    else
      render json: { message: "Users may only destroy tags of their own events" }, status: :unauthorized
    end
  end
end

class Api::EventTagsController < ApplicationController
  
  def create
    @event_tag = EventTag.new(
      event_id: params[:event_id],
      tag_id: params[:tag_id]
    )

    if @event_tag.save
      render "show.json.jb"
    else
      render json: { errors: @errors.full_messages }
    end
  end

  def update
    @event_tag = EventTag.find(params[:id])

    @event_tag.event_id = params[:event_id] || @event_tag.event_id
    @event_tag.tag_id = params[:tag_id] || @event_tag.tag_id

    render "show.json.jb"
  end

  def destroy 
    event_tag = EventTag.find(params[:id])
    event_tag.destroy
    render json: {message: "Event tag has been destroyed"}
  end
end

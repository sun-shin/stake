class Api::TagsController < ApplicationController
  
  def index
    @tags = Tag.all
    render "index.json.jb"
  end

  def create
    @tag = Tag.new(
      name: params[:name]
    )
    if @tag.save
      render "show.json.jb"
    else
      render json: { errors: @errors.full_messages }, status: 422
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render json: {message: "Tag has been destroyed"}
  end
end

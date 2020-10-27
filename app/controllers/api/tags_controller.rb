class Api::TagsController < ApplicationController
  # create and destroy only on back-end
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
      render json: { errors: @tag.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.destroy
    render json: {message: "Tag has been destroyed"}
  end
end

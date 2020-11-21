class Api::MemesController < ApplicationController

  # before_action :authenticate_user, except: [:index, :show]
  
  def index
    @memes = Meme.all
    render "index.json.jb"
  end

  def create
    @meme = Meme.new(
      toptext: params[:toptext],
      bottomtext: params[:bottomtext],
      user_id: current_user.id,
      image_url: params[:image_url]
    )
    if @meme.save
      render "show.json.jb"
    else 
      render json: {errors: @meme.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @meme = Meme.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @meme = Meme.find_by(id: params[:id])

    if @meme.user_id == current_user.id
      @meme.toptext = params[:toptext] || @meme.toptext
      @meme.bottomtext = params[:bottomtext] || @meme.bottomtext
      @meme.image_url = params[:image_url] || @meme.image_url

      if @meme.save
        render "show.json.jb"
      else 
        render json: {errors: @meme.errors.full_messages}, status: :unprocessable_entity
      end 
    else 
      render json: {message: "This isn't your meme to edit!"}
    end 

  end

  def destroy
    @meme = Meme.find_by(id: params[:id])
    if @meme.user_id == current_user.id
      @meme.destroy
      render json: {message: "Meme successfully destroyed."}
    else 
      render json: {message: "You are unable to delete this meme."}
    end

  end

  
end

class Api::MemesController < ApplicationController
  # before_action :authenticate_user, only: [:create, :update, :destroy]
  
  def index
    # if current_user
      @memes = Meme.order(:id => :desc)
      # @memes = current_user.memes.order(:id => :asc)
      render "index.json.jb"
    # else
      # @memes = Meme.order(:id => :asc)
      # render "index.json.jb"
    # end
  end

  def create
    @meme = Meme.new(
      toptext: params[:toptext],
      bottomtext: params[:bottomtext],
      user_id: params[:user_id],
      # user_id: current_user.id,
      image_url: params[:image_url],
      complete_meme: params[:complete_meme],
      complete_meme_jpg: params[:complete_meme_jpg],
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
      @meme.complete_meme = params[:complete_meme] || @meme.complete_meme
      @meme.complete_meme_jpg = params[:complete_meme_jpg] || @meme.complete_meme_jpg
      p @meme
      @meme.save!
      render "show.json.jb"
    # else 
      # render json: { message: "This Meme did not update" }
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

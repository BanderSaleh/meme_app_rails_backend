class Api::MemesController < ApplicationController

  def index
    @meme = Meme.all
    render "index.json.jb"
  end

  def create
    @meme = Meme.new(
      toptext: params[:toptext],
      bottomtext: params[:bottomtext],
      user_id: params[:user_id],
      image_url: params[:image_url]
    )
    @meme.save
    render "show.json.jb"
  end

  def show
    @meme = Meme.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @meme = Meme.find_by(id: params[:id])
    @meme.toptext = params[:toptext] || @meme.toptext
    @meme.bottomtext = params[:bottomtext] || @meme.bottomtext
    @meme.user_id = params[:user_id] || @meme.user_id
    @meme.image_url = params[:image_url] || @meme.image_url
    @meme.save
    render "show.json.jb"
  end

  def destroy
    meme = Meme.find_by(id: params[:id])
    meme.destroy
    render json: {message: "Meme successfully destroyed."}
  end

  
end

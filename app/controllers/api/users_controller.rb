class Api::UsersController < ApplicationController

  # Index not needed, this is taken care of by the show 
  # def index
  #   if current_user
  #     @users = User.order(:id => :asc)
  #       render "users.json.jb"
  #   end
  # end

  def show
    @user = User.find_by(id: params[:id])
    render "showu.json.jb"
  end

  def create
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

# not needed, this is taken care of by the show page
  # def UserAccountPage
  #   if current_user
  #     @user = current_user
  #       render "user.json.jb"
  #   end
  # end

  def update
    @user = User.find_by(id: params[:id])

    if @user.id
      @user.first_name = params[:first_name] || @user.first_name
      @user.last_name = params[:last_name] || @user.last_name
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      p @user
      @user.save!
      render "showu.json.jb"
    end
  end

  def destroy 
    @user = User.find_by(id: current_user.id)
    @user.destroy
    render json: {message: "Your profile has been deleted."}

  end


end






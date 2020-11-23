class Api::UsersController < ApplicationController

  def index
    if current_user
      @users = User.order(:id => :asc)
        render "users.json.jb"
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render "user.json.jb"
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


  def UserAccountPage
    if current_user
      @user = current_user
        render "user.json.jb"
    end
  end




end






class Api::SessionsController < ApplicationController
  skip_before_action :authenticate

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time

        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, first_name: user.first_name, last_name: user.last_name, username: user.username, email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  # def account
  #   return current_user
  # end

  

  # def find_current_user
  #   (1..Kernel.caller.length).each do |n|
  #     RubyVM::DebugInspector.open do |i|
  #       current_user = eval "current_user rescue nil", i.frame_binding(n)
  #       return current_user unless current_user.nil?
  #     end
  #   end
  #   return nil
  # end

  

  # def account
  #   myAccount = @user
  #   render "user.json.jb"
  # end

  # def account
  #   @user = User.find_by(id: params[:id])
  #   render "user.json.jb"
  # end

  # def account
  #   if @user = current_user
  #     render "user.json.jb"
  #   else
  #     render json: {
  #       logged_in: false,
  #       message: 'no such user'
  #     }
  #   end
  # end

  # def account
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end

  # def account
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  
  # def destroy
  #   logout!
  #   render json: {
  #     status: 200,
  #     logged_out: true
  #   }
  # end



end


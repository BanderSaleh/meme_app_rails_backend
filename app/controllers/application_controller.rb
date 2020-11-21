class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:current_user, authenticate_user: [:username])
  end

  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
  
    end
  end

  helper_method :current_user

  def set_current_user
    @current_user = Authorization.current_user
    return "current_user.json.jb"
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def signed_in
    return current_user
  end
end
  

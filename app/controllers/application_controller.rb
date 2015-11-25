class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def auth_user
  #   user_id = cookies['user_token']
  #   if(user_id)
  #     user = User.find(user_id)
  #     @registed_user_name = user.user_name
  #   end
  # end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
  end
end

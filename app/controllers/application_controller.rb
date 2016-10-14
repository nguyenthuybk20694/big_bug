class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
 
  protected
  def require_admin
      redirect_to root_path unless  current_user.is_admin
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:name, :email, :avatar, :password, :password_confirmation)
    end
  end
    def configure_account_update_params
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :password, 
      :password_confirmation, :avatar, :current_password]
    end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |usr| usr.permit(:name, :username, :email, :password, :password_confirmation) }
  end
end

class ApplicationController < ActionController::Base
  # display error message when user tried to access unauthorized page
rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_path, notice: "You are not authorized to access this page"
end
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?

protected
    # Allowing Devise access to custom fields first_namd and last_name
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end

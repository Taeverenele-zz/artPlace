class ApplicationController < ActionController::Base
  # display error message when user tried to access unauthorized page
rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_path, notice: "You are not authorized to access this page"
end
end

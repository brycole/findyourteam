class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :position_name_id, :password,:photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo])
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || teams_path
  end
end

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_up_path_for(resource)
    movies_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == current_member
      stored_location_for(resource_or_scope) || movies_path
    elsif resource_or_scope == current_admin_user
      stored_location_for(resource_or_scope) || admin_dashboard_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :name_kana])
  end

end

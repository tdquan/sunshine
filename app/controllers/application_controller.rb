class ApplicationController < ActionController::Base

# Translations
  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied, with: :render_unauthorized

  def render_unauthorized
    redirect_to request.referer, alert: "You're not authorized to view this page"
  end

  def after_sign_in_path_for(user)
    contracts_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :address, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :address, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :address, :email])
  end
end

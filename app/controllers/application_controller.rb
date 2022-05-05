class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  protected

  def configure_sign_up_params
    attributes = [:name, :user_type, :email]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end

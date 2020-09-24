class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  helper_method :admin?

  def default_url_options
    {
      lang: I18n.locale == I18n.default_locale ? nil : I18n.locale
    }
  end

  private

  def set_locale
    available = I18n.locale_available?(params[:lang])
    I18n.locale = available ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_tests_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :type, :email, :password)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :type, :email, :password)
    end
  end

  def admin?
    current_user.admin? if current_user
  end
end

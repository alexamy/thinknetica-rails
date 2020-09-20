class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name, :user_type, :email, :password)
      end

      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :user_type, :email, :password)
      end
  end
end

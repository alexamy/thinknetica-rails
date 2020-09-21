class Admin::BaseController < ApplicationController
  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: 'Доступ к ресурсу запрещен' unless current_user.is_a?(Admin)
  end
end

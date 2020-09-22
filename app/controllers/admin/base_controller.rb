class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  def admin_required!
    redirect_to root_path, alert: 'Доступ к ресурсу запрещен' unless current_user.admin?
  end
end

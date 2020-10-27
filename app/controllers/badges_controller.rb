class BadgesController < ApplicationController
  def index
    @badges = current_user.badges.uniq
  end
end

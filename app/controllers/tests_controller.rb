class TestsController < ApplicationController
  def index
    render plain: Test.all.to_json
  end

  def show
    render plain: Test.find(params[:id]).to_json
  end
end

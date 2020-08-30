class TestsController < ApplicationController
  def index
    render plain: Test.all.to_json
  end
end

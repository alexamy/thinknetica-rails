class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def index
    render plain: Test.all.to_json
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end

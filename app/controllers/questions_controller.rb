class QuestionsController < ApplicationController
  def index
    render plain: Test.find(params[:test_id]).questions.to_json
  end

  def show
    render plain: Question.find(params[:id]).to_json
  end
end

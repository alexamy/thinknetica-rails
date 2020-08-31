class QuestionsController < ApplicationController
  before_action :find_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    render plain: @test.questions.to_json
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def destroy
    @question.destroy
    render plain: "Success"
  end

  private

  def rescue_with_not_found
    render plain: 'Question not found'
  end

  def question_params
    params.require(:question).permit(:body).merge(test: @test)
  end

  def find_test
    @test = Test.find(params[:test_id]) if params[:test_id]
  end

  def find_question
    @question = Question.find(params[:id])
  end
end

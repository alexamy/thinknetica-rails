class QuestionsController < ApplicationController
  before_action :find_test
  before_action :scope_questions

  def index
    render plain: @questions.to_json
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end

  def create
    question = Question.create(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:id]).destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id]) if params[:test_id]
  end

  def scope_questions
    @questions = @test ? @test.questions : Question.all
  end
end

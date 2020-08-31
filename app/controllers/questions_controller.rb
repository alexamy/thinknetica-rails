class QuestionsController < ApplicationController
  before_action :find_test
  before_action :scope_questions
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def index
    render plain: @questions.to_json
  end

  def show
  end

  def new
  end

  def create
    question = Question.new(question_params)

    answer_bodies = params[:question][:answers].reject(&:empty?)
    question.answers = answer_bodies.map do |answer|
      Answer.new(body: answer, question: question)
    end

    question.save
    question.answers.each { |answer| answer.save }

    render plain: question.persisted? ? 'Success' : 'Fail'
  end

  def destroy
    Question.find(params[:id]).destroy
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

  def scope_questions
    @questions = @test ? @test.questions : Question.all
  end
end

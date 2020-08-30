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
    question = Question.new(question_params)

    answers = params[:question][:answers].map do |answer|
      next if answer.empty?
      Answer.new(body: answer, question: question)
    end

    answers.compact!

    question.test = @test
    question.answers = answers

    question.save
    answers.each { |answer| answer.save }

    render plain: question.persisted? ? 'Success' : 'Fail'
  end

  def destroy
    Question.find(params[:id]).destroy
    render plain: "Success"
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

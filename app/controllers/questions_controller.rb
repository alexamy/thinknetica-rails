class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_not_found

  def show
  end

  private

  def rescue_with_not_found
    render plain: 'Question not found'
  end

  def find_question
    @question = Question.find(params[:id])
  end
end

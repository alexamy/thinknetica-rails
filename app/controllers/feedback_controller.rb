class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      flash[:greeting] = t('.congratulation')
      redirect_to action: :new
    else
      render :new
    end
  end

  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end

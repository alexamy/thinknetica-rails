class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]
  before_action :set_gist_service, only: :gist

  def show
  end

  def result
  end

  def gist
    begin
      gist = create_gist
      flash_options = { notice: t('.success', gist: gist.url) }
    rescue Error
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def create_gist
    result = @gist_service.call
    Gist.create(
      github_id: result[:id],
      question: @test_passage.current_question,
      user: current_user
    )
  end

  def set_gist_service
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    @gist_service = GistQuestionService.new(@test_passage.current_question, client: client)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

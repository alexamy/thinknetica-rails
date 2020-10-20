class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update gist]

  def show
    complete_test if @test_passage.completed?
  end

  def result
  end

  def gist
    client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    gist_service = GistQuestionService.new(@test_passage.current_question, client: client)
    response = gist_service.call

    if gist_service.success?
      gist = Gist.create(
        github_id: response[:id],
        question: @test_passage.current_question,
        user: current_user
      )
      flash_options = { notice: t('.success', gist: gist.url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      complete_test
    else
      render :show
    end
  end

  private

  def complete_test
    unless @test_passage.completed_at
      @test_passage.touch(:completed_at)
      TestsMailer.completed_test(@test_passage).deliver_now
    end

    redirect_to result_test_passage_path(@test_passage)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

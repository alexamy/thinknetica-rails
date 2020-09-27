class GistQuestionService
  SUCCESS_STATUS_CODES = (200...300)

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || GitHubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    SUCCESS_STATUS_CODES.include?(@client.last_response.status)
  end

  private

  def gist_params
    {
      description: gist_description,
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_description
    I18n.t(
      :description,
      title: @test.title,
      scope: %i[services gist_question_service gist_params]
    )
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end

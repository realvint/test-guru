class GistQuestionService

  STATUS_SUCCESS = 201

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.access_token)
  end

  def call
    @client.create_gist(gist_params)
  end

  def url
    @client.last_response.data[:html_url]
  end

  def success?
    @client.last_response.status == STATUS_SUCCESS
  end

  private

  def gist_params
    {
      description: I18n.t('test_passages.gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title,
     @question.answers.pluck(:title)].join("\n")
  end
end

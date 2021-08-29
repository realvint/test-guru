class GistQuestionService

  STATUS_SUCCESS = 201

  Result = Struct.new(:url, :status_code) do
    def success?
      status_code == STATUS_SUCCESS
    end
  end

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: Rails.application.credentials.access_token)
  end

  def call
    @client.create_gist(gist_params)
    Result.new(@client.last_response.data[:html_url], @client.last_response.status)
  end

  private

  def gist_params
    {
      description: I18n.t('admin.gists.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.title, *@question.answers.pluck(:title)].join("\n")
  end
end

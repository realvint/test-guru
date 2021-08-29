class GistsController < ApplicationController
  def create
    test_passage = TestPassage.find(params[:id])
    result = GistQuestionService.new(test_passage.current_question).call

    if result.success?
      flash[:notice] = "#{t('.success')} - #{view_context.link_to(t('.created_gist'), result.url, target: '_blank')}"
      current_user.gists.create(question: test_passage.current_question, url: result.url)
    else
      flash[:alert] = t('.failure')
    end
    redirect_to test_passage
  end
end

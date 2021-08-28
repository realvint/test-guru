class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    flash_options = if result.success?
                      create_gist(result)
                      { notice: "#{t('.success')} - #{view_context.link_to(t('.created_gist'),
                                                                           result.url,
                                                                           target: '_blank')} " }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  private

  def create_gist(result)
    current_user.gists.create(question: @test_passage.current_question, url: result.url)
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

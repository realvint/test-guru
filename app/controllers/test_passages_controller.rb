class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result send_result]

  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      AddBadgesService.new(@test_passage).add_badge
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def send_result
    TestsMailer.completed_test(@test_passage).deliver_later
    redirect_to result_test_passage_path(@test_passage), notice: t('.notice')
  end

  def result; end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end

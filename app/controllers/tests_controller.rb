class TestsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find params[:id]
    if @test.questions.any?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to tests_path, alert: t('.rescue.no_questions')
    end
  end

  private

  def rescue_with_test_not_found
    render plain: t('.rescue.not_found')
  end
end

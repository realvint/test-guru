class TestsController < ApplicationController
  before_action :set_tests!, only: %i[index show]
  before_action :set_test!, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show
    @questions = @test.questions.all
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_test!
    @test = Test.find params[:id]
  end

  def set_tests!
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end

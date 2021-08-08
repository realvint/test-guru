class TestsController < ApplicationController
  before_action :set_tests, only: %i[index show]
  before_action :set_test, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index; end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = User.first
    if @test.save
      redirect_to @test, notice: 'Тест создан'
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Тест изменён'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Тест был удалён'
  end


  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find params[:id]
  end

  def set_tests
    @tests = Test.all
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end

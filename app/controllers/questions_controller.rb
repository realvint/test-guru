class QuestionsController < ApplicationController
  before_action :set_test!

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.map { |question| question.title.to_s }
    render plain: questions.join
  end

  def show
    @question = @test.questions.find params[:id]
    render plain: @question.title
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build question_params
    if @question.save
      redirect_to test_questions_path(@test)
    else
      render 'new'
    end
  end

  def destroy
    question = @test.questions.find params[:id]
    question.destroy
    redirect_to test_questions_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def set_test!
    @test = Test.find params[:test_id]
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end

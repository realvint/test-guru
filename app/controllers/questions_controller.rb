class QuestionsController < ApplicationController
  before_action :set_test!
  before_action :set_question!, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build question_params
    if @question.save
      redirect_to test_path(@test), notice: 'Вопрос был создан'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @question.update question_params
      redirect_to test_path(@test), notice: 'Вопрос был изменён'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@test), notice: 'Вопрос был удалён'
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

  def set_test!
    @test = Test.find params[:test_id]
  end

  def set_question!
    @question = @test.questions.find params[:id]
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end

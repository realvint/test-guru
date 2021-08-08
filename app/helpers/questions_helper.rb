module QuestionsHelper
  def question_header(question)
    "#{question.persisted? ? 'Редактировать' : 'Создать новый'} вопрос для #{question.test.title} "
  end
end
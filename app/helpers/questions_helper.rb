module QuestionsHelper
  def question_header(question)
    "#{question.persisted? ? t('questions.header.edit') : t('questions.header.create')}
     #{t('questions.header.question_for')} #{question.test.title} "
  end
end
module TestsHelper
  def test_header(test)
    "#{test.persisted? ? 'Редактировать' : 'Создать'}  #{test.title}"
  end
end
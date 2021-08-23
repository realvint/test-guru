module TestsHelper
  def test_header(test)
    "#{test.persisted? ? t('tests.header.edit') : t('tests.header.create')}  #{test.title}"
  end
end
class ApplicationMailer < ActionMailer::Base
  default from: %("Система тестирования - TestGuru" <info@rem69.ru>)
  layout 'mailer'
end

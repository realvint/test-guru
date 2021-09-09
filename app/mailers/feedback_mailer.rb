class FeedbackMailer < ApplicationMailer

  def feedback(form_params)
    @title = form_params[:title]
    @body = form_params[:body]

    mail to: Admin.first.email || 'admin@rem69.ru'
  end
end
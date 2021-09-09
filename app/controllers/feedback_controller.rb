class FeedbackController < ApplicationController
  skip_before_action :authenticate_user!

  def index; end

  def create
    FeedbackMailer.feedback(params).deliver_now
    redirect_to feedback_index_path, notice: t('.notice')
  end
end

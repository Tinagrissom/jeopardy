class QuestionsController < ApplicationController
  def index
      render json: { message: "Hi", status: 200}
  end
end

class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      render json: Question.all
  end

  def show
      render json: Question.find(params["id"])
  end

  def create
      puts params
      render json: Question.create(params)
  end

  def delete
    render json: Question.delete(params["id"])
  end

  def update
    puts params
    render json: Question.update(params["id"], params)
  end
end

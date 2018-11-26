class QuestionsController < ApplicationController
  before_action :set_question, only: :show

def index
    @part_id = params[:id]
    @part = Part.find(@part_id)
    @book = Book.find(@part.book_id)
    @questions = @part.questions
end

  def show
    @part_id = @question.part_id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
end

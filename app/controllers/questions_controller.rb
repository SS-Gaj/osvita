class QuestionsController < ApplicationController
  before_action :set_question, only: :show

  # GET /questions
  # GET /questions.json
def index
    #@questions = Question.all
 #byebug
    @part_id = params[:id]
    @part = Part.find(@part_id)
    @book = Book.find(@part.book_id)
    @questions = @part.questions
end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @part_id = @question.part_id
  end
  
#def new
#def edit
#def create
#def update
#def destroy
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
#def question_params
end

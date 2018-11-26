class Admin::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
def index
 #byebug
    @part_id = params[:id]
    @part = Part.find(@part_id)
    @book = Book.find(@part.book_id)
    @questions = @part.questions
end

  # GET /questions/1
  def show
    @part_id = @question.part_id
  end

  # GET /questions/new
  def new
    @part = Part.find(params[:id])
    @question = @part.questions.build()
  end

  # GET /questions/1/edit
  def edit
    @part_id = @question.part_id
  end

  # POST /questions
  def create
    @part = Part.find(params[:question][:part_id])
    @question = @part.questions.build(question_params)    
    respond_to do |format|
      if @question.save
        format.html { redirect_to [:admin, @question], notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [:admin, @question], notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  def destroy
    @part_id = @question.part_id
    @question.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", id: @part_id }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :answer1, :answer2, :answer3, :answer4, :best, :part_id)
    end
end

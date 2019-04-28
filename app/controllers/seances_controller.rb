class SeancesController < ApplicationController
  before_action :set_seance, only: [:show, :edit, :destroy]
# см.п.5.2:
# Поскольку этот контроллер был сгенерирован со scaffold,
# то теперь нужно посмотреть, что из него убрать

  # GET /seances
  # GET /seances.json
  def index
    # @part_id = params[:id] if params[:id] =! nil 
    @part_id = params[:id]
    @part = Part.find(@part_id)
    @questions = @part.questions
    @user = User.find(current_user.profile.user_id)
    mas = []
    @questions.each do |elem|
      mas.push(elem.id)
    end
    @seances = @user.seances.create(quest1: mas[0], quest2: mas[1], quest3: mas[2], quest4: mas[3], quest5: mas[4], quest6: mas[5], 
    quest7: mas[6], quest8: mas[7], quest9: mas[8], quest10: mas[9], )

#    @seances = Seance.first
    #@seance_id = @seances.id
    #@seance = Seance.first
    @seance_id = @seances.id
    @howmuch = '1'
    @one  = 0
    @two  = 0
    @three  = 0
    @four = 0
# 1-й Вопрос - из поля quest1
    @question = Question.find(@seances.quest1)    
    @test_question = @question.question
    @one_var = @question.answer1
    @two_var  = @question.answer2
    @three_var  = @question.answer3
    @four_var = @question.answer4
#byebug
    render "testing"
  
  end

  # GET /seances/1
  # GET /seances/1.json
  def show
  end

  # GET /seances/new
  def new
    @seance = Seance.new
  end

  # GET /seances/1/edit
  def edit
  end


  # DELETE /seances/1
  # DELETE /seances/1.json
  def destroy
    @part_id = @seance.part_id
    @seance.destroy
    respond_to do |format|
      format.html { redirect_to seances_url, notice: 'Seance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def testing
    @howmuch = params[:howmuch].to_i
#    @seance = Seance.find(11)
    #@seance_id1 = params[:id]
    #@seance_id2 = params[:seance][:id]
    @seance_id = params[:seance_id]

#byebug
#    @seance = Seance.find(params[:seance][:id])
    @seances = Seance.find(@seance_id)
    #@seances = Seance.first
    @one  = params[:one]
    @two  = params[:two]
    @three  = params[:three]
    @four = params[:four]
    if @howmuch == 1
      @seances.be_quests = '1, '
      if @one == '1'
        @seances.answ1 = 1
      elsif @two == '1'
        @seances.answ1 = 2
      elsif @three == '1'
        @seances.answ1 = 3
      elsif @four == '1'
        @seances.answ1 = 4
      end
      # 2-й Вопрос - из поля quest2
      @question = Question.find(@seances.quest2)
    elsif @howmuch == 2
      @seances.be_quests = @seances.be_quests + '2, '
      if @one == '1'
        @seances.answ2 = 1
      elsif @two == '1'
        @seances.answ2 = 2
      elsif @three == '1'
        @seances.answ2 = 3
      elsif @four == '1'
        @seances.answ2 = 4
      end
      # 3-й Вопрос - из поля quest3
      @question = Question.find(@seances.quest3)
    elsif @howmuch == 3
      @seances.be_quests = @seances.be_quests + '3, '
      if @one == '1'
        @seances.answ3 = 1
      elsif @two == '1'
        @seances.answ3 = 2
      elsif @three == '1'
        @seances.answ3 = 3
      elsif @four == '1'
        @seances.answ3 = 4
      end
      # 4-й Вопрос - из поля quest4
      @question = Question.find(@seances.quest4)
    elsif @howmuch == 4
      @seances.be_quests = @seances.be_quests + '4, '
      if @one == '1'
        @seances.answ4 = 1
      elsif @two == '1'
        @seances.answ4 = 2
      elsif @three == '1'
        @seances.answ4 = 3
      elsif @four == '1'
        @seances.answ4 = 4
      end
      # 5-й Вопрос - из поля quest5
      @question = Question.find(@seances.quest5)
    elsif @howmuch == 5
      @seances.be_quests = @seances.be_quests + '5; '
      if @one == '1'
        @seances.answ5 = 1
      elsif @two == '1'
        @seances.answ5 = 2
      elsif @three == '1'
        @seances.answ5 = 3
      elsif @four == '1'
        @seances.answ5 = 4
      end
    end
    @seances.save
    
    @howmuch = @howmuch + 1
#byebug
    if @howmuch > 5 
      render "show"
    else
    @test_question = @question.question
    @one_var = @question.answer1
    @two_var  = @question.answer2
    @three_var  = @question.answer3
    @four_var = @question.answer4
    
      @howmuch = @howmuch.to_s
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seance
      @seance = Seance.find(params[:id])
    end

end

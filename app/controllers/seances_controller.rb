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
#   @seance = @user.seances.create(quest1: 11)
#    mas = []
#    @questions.each do |elem|
#      mas.push(elem.id)
#    end
#    @seance = @user.seances.create(quest1: mas[0], quest2: mas[1], quest3: mas[2], quest4: mas[3], quest5: mas[4], quest6: mas[5], 
#    quest7: mas[6], quest8: mas[7], quest9: mas[8], quest10: mas[9], )

    @seances = Seance.first
    @howmuch = '1'
    @one  = 0
    @two  = 0
    @three  = 0
    @four = 0
      
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
    @one  = params[:one]
    @two  = params[:two]
    @three  = params[:three]
    @four = params[:four]
    @howmuch = params[:howmuch].to_i + 1

#byebug
    if @howmuch > 5 
      render "show"
    else
      @howmuch = @howmuch.to_s
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seance
      @seance = Seance.find(params[:id])
    end

end

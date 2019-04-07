class SeancesController < ApplicationController
  before_action :set_seance, only: [:show, :edit, :update, :destroy]
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
    @howmuch = 5
    @mascheck = 1
    #@mascheck.push("1", "Первый вариант")
      
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

  # POST /seances
  # POST /seances.json
  def create
    @seance = Seance.new(seance_params)

    respond_to do |format|
      if @seance.save
        format.html { redirect_to @seance, notice: 'Seance was successfully created.' }
        format.json { render :show, status: :created, location: @seance }
      else
        format.html { render :new }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seances/1
  # PATCH/PUT /seances/1.json
  def update
    respond_to do |format|
      if @seance.update(seance_params)
        format.html { redirect_to @seance, notice: 'Seance was successfully updated.' }
        format.json { render :show, status: :ok, location: @seance }
      else
        format.html { render :edit }
        format.json { render json: @seance.errors, status: :unprocessable_entity }
      end
    end
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
    @howmuch = 5
byebug

    render "show"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seance
      @seance = Seance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seance_params
      params.require(:seance).permit(:quest1, :quest2, :quest3, :quest4, :quest5, :quest6, :quest7, :quest8, :quest9, :quest10, :be_quests, :answ1, :answ2, :answ3, :answ4, :answ5, :answ6, :answ7, :answ8, :answ9, :answ10, :user_id)
    end
end

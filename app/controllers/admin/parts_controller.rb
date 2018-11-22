class Admin::PartsController < ApplicationController
  before_action :set_part, only: [:show, :edit, :update, :destroy]

  # GET /parts
  # GET /parts.json
  def index
    #@parts = Part.all
 #byebug
    #@book_id = params[:book_id]
    @book_id = params[:id]
    @book = Book.find(@book_id)
    @parts = @book.parts
  end

  # GET /parts/1
  # GET /parts/1.json
  def show
    @book_id = @part.book_id
  end

  # GET /parts/new
  def new
    #@part = Part.new
    @book = Book.find(params[:id])
    @part = @book.parts.build()
  end

  # GET /parts/1/edit
  def edit
    @book_id = @part.book_id
  end

  # POST /parts
  # POST /parts.json
  def create
    @book = Book.find(params[:part][:book_id])
    @part = @book.parts.build(part_params)    
    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        #format.html { redirect_to parts_path, notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parts/1
  # PATCH/PUT /parts/1.json
  def update
    respond_to do |format|
      if @part.update(part_params)
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        #format.html { redirect_to parts_path, notice: 'Part was successfully created.' }
        format.json { render :show, status: :ok, location: @part }
      else
        format.html { render :edit }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parts/1
  # DELETE /parts/1.json
  def destroy
    @part.destroy
    respond_to do |format|
      format.html { redirect_to admin_parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_params
      params.require(:part).permit(:part, :book_id)
    end
end

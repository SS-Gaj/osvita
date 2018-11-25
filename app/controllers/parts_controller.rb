class PartsController < ApplicationController
#  before_action :set_part, only: :show

  # GET /parts
  # GET /parts.json
  def index
    #@parts = Part.all
 #byebug
    #@book_id = params[:book_id]
    @book_id = params[:id]
    @book = Book.find(@book_id)
    #@book = Book.find(2)
    @parts = @book.parts
  end

  # GET /parts/1
  # GET /parts/1.json
#  def show
#  def new
#  def edit
#  def create
#  def update
#  def destroy
#    def set_part
#    def part_params
end

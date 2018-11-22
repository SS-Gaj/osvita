class BooksController < ApplicationController
  before_action :set_book, only: :show

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    redirect_to parts_path	#parts#index
  end

  # GET /books/new
#  def new
#  def edit
#  def create
#  def update
#  def destroy
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
#def book_params
end

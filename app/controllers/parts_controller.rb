class PartsController < ApplicationController

  def index
    @book_id = params[:id]
    @book = Book.find(@book_id)
    @parts = @book.parts
  end
end

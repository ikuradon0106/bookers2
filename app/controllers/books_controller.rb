class BooksController < ApplicationController
  def new
    
  end

  def index
    @book = Book.new
  end

  def show
    @book = Book.new(book_paramas)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def about
  end
end

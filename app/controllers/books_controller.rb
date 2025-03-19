class BooksController < ApplicationController
  def new
    
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def about
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


end

private
def book_paramas
  params.require(:book).permit(:title, :body)
end
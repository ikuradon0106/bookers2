class BooksController < ApplicationController

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      render :index
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


end

private
def book_params
  params.require(:book).permit(:title, :opinion)
end
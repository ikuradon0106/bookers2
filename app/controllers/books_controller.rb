class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

   def show
    @book = Book.find(params[:id]) 
    @user = @book.user 
    # @new_book = Book.new
    # @books = Book.all
    end
  

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id 

    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      # @user = User.find(current_user.id)
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
        render "edit"
    else
        redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
     @book.user_id = current_user.id
    if @book.update(book_params)
      flash[:notice]="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def new
    @book = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.user == current_user 
       @book.destroy
       flash[:notice]="Book was successfully destroyed."
       redirect_to books_path
    end
  end

private

def book_params
  params.require(:book).permit(:title, :body)
end

def is_matching_login_user
  @book = Book.find(params[:id])
  unless @book.user == current_user
    redirect_to books_path
  end
end

end
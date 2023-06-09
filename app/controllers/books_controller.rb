class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
     flash[:notice] = "successfully"
     redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end

  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "successfully"
    redirect_to book_path(@book.id)
   else
     # @book = Book.find(params[:id])
     render :edit
   end
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
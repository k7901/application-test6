class FavoritesController < ApplicationController

  def create
    unless Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.new(book_id: @book.id)
    @favorite.save!
    end
    #redirect_back fallback_location: root_path
  end

  def destroy
   if Favorite.find_by(book_id: params[:book_id], user_id: current_user.id)
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
    #redirect_back fallback_location: root_path
   end
  end
end

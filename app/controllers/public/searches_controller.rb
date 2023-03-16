class Public::SearchesController < ApplicationController

  def search
    @notices = Notice.where('title LIKE ?', "%#{params[:word]}%")
  end



  # def set_genre
  # @genres = Genre.all
  # end
end

class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_notice = @genre.notices.page(params[:page]).per(4)
  end
end

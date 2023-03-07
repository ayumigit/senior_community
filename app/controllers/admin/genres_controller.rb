class Admin::GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルを追加しました。"
    else
      flash.now[:danger] = "予期せぬエラーが発生しました。"
      @genres = Genre.all
      render 'index'
    end
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genre_path(@genre.id)
    else
      render edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end


end

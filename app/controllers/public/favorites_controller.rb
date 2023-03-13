class Public::FavoritesController < ApplicationController
  def create
    notice = Notice.find(params[:notice_id])
    favorite = current_senior.favorites.new(notice_id: notice.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    notice = Notice.find(params[:notice_id])
    favorite = current_senior.favorites.find_by(notice_id: notice.id)
    favorite.destroy
    redirect_to request.referer
  end

end

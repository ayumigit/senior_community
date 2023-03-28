class Admin::NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end
  def show
    @notice = Notice.find(params[:id])
  end

  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    redirect_to admin_notices_path
  end

  private
  def notice_params
    params.require(:notice).permit(:image, :title, :body, :genre_id)

  end
end

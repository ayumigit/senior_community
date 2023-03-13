class Public::NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
    @notices = Notice.all
    @notice_comment = NoticeComment.new
  end

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    @notice = Notice.find(params[:id])
    if @notice.update(notice_params)
      redirect_to notice_path(@notice.id)
    else
      render edit
    end
  end

  def destroy
    @notice = Notice.find(params[:id])
    @notice.destroy
    redirect_to notices_path
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.senior_id = current_senior.id
    @notice.save!
    redirect_to notices_path
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :image, :body, :genre_id, :place, :start_datetime, :end_datetime, :notice_image)
  end
end
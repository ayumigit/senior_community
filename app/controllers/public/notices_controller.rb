class Public::NoticesController < ApplicationController
  def index
    @notice = Notice.new
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
    @notices = Notice.all
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

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.save
    redirect_to notice_path(@notice)
  end

  private
  def notice_params
    params.require(:notice).permit(:title, :image, :body, :genre_id, :place, :start_datetime, :end_datetime)
  end
end
class Admin::NoticeCommentsController < ApplicationController

  def destroy
    NoticeComment2.find_by(id: params[:id], notice_id: params[:notice_id]).destroy
    redirect_to request.referer
  end

  private
  def notice_comment2_params
    params.require(:notice_comment2).permit(:comment)
  end
end

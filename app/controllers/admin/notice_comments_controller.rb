class Admin::NoticeCommentsController < ApplicationController

  def destroy
    NoticeComment.find_by(id: params[:id], notice_id: params[:notice_id]).destroy
    redirect_to request.referer
  end

  private
  def notice_comment_params
    params.require(:notice_comment).permit(:comment)
  end
end

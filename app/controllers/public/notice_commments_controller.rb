class Public::NoticeCommmentsController < ApplicationController
  def create
    notice = Notice.find(params[:notice_id])
    comment = current_senior.notice_comments.new(notice_comment_params)
    comment.notice_id = notice.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    NoticeComment.find_by(id: params[:id], notice_id: params[:notice_id]).destroy
    redirect_to request.referer
  end

  private
  def notice_comment_params
    params.require(:notice_comment).permit(:comment)
  end
end

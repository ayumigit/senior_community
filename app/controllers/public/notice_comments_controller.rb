class Public::NoticeCommentsController < ApplicationController
  def create
    notice = Notice.find(params[:notice_id])
    comment = current_senior.notice_comment2s.new(notice_comment2_params)
    comment.notice_id = notice.id
    comment.rate = params.dig(:notice, :rate)
    comment.save
    redirect_to request.referer
  end



  def destroy
    NoticeComment2.find_by(id: params[:id], notice_id: params[:notice_id]).destroy
    redirect_to request.referer
  end

  private
  def notice_comment2_params
    params.require(:notice_comment2).permit(:comment)
  end
end

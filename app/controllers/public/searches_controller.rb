class Public::SearchesController < ApplicationController

  def search
    # byebug
    #@notices = Notice.where('title LIKE ?', "%#{params[:word]}%")
    @search_params = notice_search_params#検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @notices = Notice.search(@search_params).joins(:senior)  #Reservationモデルのsearchを呼び出し、引数としてparamsを渡している。

    tag = Tag.find_by(name: params[:tag])
    if tag
      @notices = Notice.includes(:notice_tags).where(notice_tags: {tag_id: tag.id})
    #else
      #@notices = []
    end
  end

  private

  def notice_search_params
    params.fetch(:search, {}).permit(:title, :start_datetime, :end_datetime, :place)
    #fetch(:search, {})と記述することで、検索フォームに値がない場合はnilを返し、エラーが起こらなくなる
    #ここでの:searchには、フォームから送られてくるparamsの値が入っている
  end


end


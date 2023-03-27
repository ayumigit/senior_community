class Public::SearchesController < ApplicationController

  def search
    tag = Tag.find_by(name: params[:tag])
    @notices = Notice.where('title LIKE ?', "%#{params[:word]}%")
    if tag
      @notices = Notice.includes(:notice_tags).where(notice_tags: {tag_id: tag.id})
    else
      @notices = []
    end
  end

end


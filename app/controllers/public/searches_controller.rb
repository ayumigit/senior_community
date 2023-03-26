class Public::SearchesController < ApplicationController

  def search
    @notices = Notice.where('title LIKE ?', "%#{params[:word]}%")
    @notice_tag = Notice.where('tag_name LIKE ?', "%#{params[:tag]}%")
  end

end


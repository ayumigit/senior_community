class Public::SearchesController < ApplicationController

  def search
    @notices = Notice.where('title LIKE ?', "%#{params[:word]}%")
  end
end

class Public::RelationshipsController < ApplicationController
  before_action :authenticate_senior!
  def create
    senior = Senior.find(params[:senior_id])
    current_senior.follow(senior)
		redirect_to request.referer
  end

  def destroy
    senior = Senior.find(params[:senior_id])
    current_senior.unfollow(senior)
		redirect_to request.referer
  end

  def followings
    senior = Senior.find(params[:senior_id])
		@seniors = senior.followings
  end

  def followers
    senior = Senior.find(params[:senior_id])
		@seniors = senior.followers
  end
end

class Public::SeniorsController < ApplicationController

  def show
    @senior_now = current_senior
    @senior = Senior.find(params[:id])
  end

  def index
    @senior = current_senior
    @seniors = Senior.all
  end

  def edit
    @senior = current_senior
  end

  def update
    @senior = current_senior
    if @senior.update(senior_params)
      redirect_to seniors_path
    else
      redirect_to request.referer
    end
  end

  private

  def seniorr_params
    params.require(:senior).permit(:first_name, :last_name, :introduction, :profile_image, :nickname, :is_active, :email)
  end




end

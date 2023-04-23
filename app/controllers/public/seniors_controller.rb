class Public::SeniorsController < ApplicationController

  def show
    @senior_now = current_senior
    @senior = Senior.find(params[:id])
  end

  def index
    @senior = current_senior
    @seniors = Senior.page(params[:page]).per(4)
  end

  def edit
    senior = Senior.find(params[:id])
      unless senior.id == current_senior.id
      redirect_to seniors_path
      end

    @senior = current_senior
  end

  def update
    @senior = current_senior
    if @senior.update(senior_params)
      redirect_to seniors_path(@senior.id)
    else
      render :edit
    end
  end

  private

  def senior_params
    params.require(:senior).permit(:first_name,  :last_name, :introduction, :profile_image, :nickname, :is_active, :email)
  end




end

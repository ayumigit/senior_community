class Admin::SeniorsController < ApplicationController
  def index
    @seniors = Senior.all
    @senior = current_senior
  end

  def show
    @senior = Senior.find(params[:id])
    @senior_now = current_senior
  end

  def edit
    @senior = Senior.find(params[:id])
  end

  def update
    @senior = Senior.find(params[:id])
    if @senior.update(senior_params)
      flash[:notice] = "更新に成功しました！"
      redirect_to admin_senior_path(@senior.id)
    else
      render :edit
    end
  end

  private
  def senior_params
    params.require(:senior).permit(:email, :last_name, :first_name, :nickname, :introduction, :is_active, :id)
  end

end

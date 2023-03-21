class Admin::SeniorsController < ApplicationController
  def index
    @seniors = Senior.all
  end

  def show
    @senior = Senior.find(params[:id])
  end

  def edit
    @senior = Senior.find(params[:id])
  end

  def update
    @senior = Senior.find(params[:id])
    if @senior.update(senior_params)
      flash[:notice] = "更新に成功しました！"
      redirect_to admin_senior_path(@senior)
    else
      render :edit
    end
  end

  def senior_params
    params.require(:senior).permit(:email, :last_name, :first_name, :nickname, :is_deleted)
  end

end
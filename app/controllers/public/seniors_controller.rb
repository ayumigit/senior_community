class Public::SeniorsController < ApplicationController

  def show
    @senior = current_senior
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



end

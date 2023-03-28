class Public::HomesController < ApplicationController
  def top
    @senior = current_senior
  end

  def about
  end

  def guest_sign_in
      senior = Senior.find_or_create_by!(email: 'guest@example.com') do |senior|
      senior.password = SecureRandom.urlsafe_base64
      #senior.skip_confirmation!  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
  end
      sign_in senior
      redirect_to notices_path
    #redirect_to seniors_path(@senior), notice: 'ゲストユーザーとしてログインしました。'
  end
end

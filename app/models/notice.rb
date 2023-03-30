class Notice < ApplicationRecord
  has_one_attached :notice_image
  belongs_to :genre
  belongs_to :senior
  has_many :notice_comment2s, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :notice_tags, dependent: :destroy
  has_many :tags, through: :notice_tags


  def favorited_by?(senior)
    favorites.exists?(senior_id: senior.id)
  end

  def get_notice_image(width, height)
    unless notice_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      notice_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    notice_image.variant(resize_to_fill: [width, height]).processed
  end

  def save_tags(savenotice_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - savenotice_tags
    new_tags = savenotice_tags - current_tags
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    new_tags.each do |new_name|
      notice_tag = Tag.find_or_create_by(name:new_name)
      self.tags << notice_tag
    end
  end

  scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

    title_like(search_params[:title])
      .start_datetime(search_params[:start_datetime])
      .end_datetime(search_params[:end_datetime])
      .place_like(search_params[:place])   #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end

  scope :title_like, -> (title) { where('title LIKE ?', "%#{title}%") if title.present? }  #scopeを定義。
  scope :start_datetime, -> (from) { where('? <= start_datetime', from) if from.present? }
  scope :end_datetime, -> (to) { where('end_datetime<= ?', to) if to.present? }
   #日付の範囲検索をするため、fromとtoをつけている
  scope :place_like, -> (place) { where('place LIKE ?', "%#{place}%") if place.present? }
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない












  def self.search_for(content, method)
    if method == 'perfect'
      Notice.where(title: content)
    elsif method == 'forward'
      Notice.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Notice.where('title LIKE ?', '%'+content)
    else
      Notice.where('title LIKE ?', '%'+content+'%')
    end
  end
end

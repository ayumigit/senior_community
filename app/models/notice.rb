class Notice < ApplicationRecord
  has_one_attached :notice_image
  belongs_to :genre
  belongs_to :senior
  has_many :notice_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


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

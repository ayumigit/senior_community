class Notice < ApplicationRecord
  has_one_attached :notice_image
  belongs_to :genre
  belongs_to :senior

  def get_notice_image(width, height)
    unless notice_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      notice_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    notice_image.variant(resize_to_fill: [width, height]).processed
  end
end

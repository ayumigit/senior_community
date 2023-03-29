class Senior < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image
  has_many :notices, dependent: :destroy
  has_many :notice_comment2s, dependent: :destroy
  has_many :favorites, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_fill: [width, height]).processed
  end

  def follow(senior)
    relationships.create(followed_id: senior.id)
  end

  def unfollow(senior)
    relationships.find_by(followed_id: senior.id).destroy
  end

  def following?(senior)
    followings.include?(senior)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Senior.where(nickname: content)
    elsif method == 'forward'
      Senior.where('nickname LIKE ?', content + '%')
    elsif method == 'backward'
      Senior.where('nickame LIKE ?', '%' + content)
    else
      Senior.where('nickname LIKE ?', '%' + content + '%')
    end
  end


end

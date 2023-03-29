class Genre < ApplicationRecord
  has_many :notices


  def discount_info?
    name == "企業・お店側からのお得な割引情報"
  end
end

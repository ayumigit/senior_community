class Favorite < ApplicationRecord
  belongs_to :senior
  belongs_to :notice
  validates_uniqueness_of :notice_id, scope: :senior_id
end

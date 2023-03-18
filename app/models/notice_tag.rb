class NoticeTag < ApplicationRecord
  belongs_to :notice
  belongs_to :tag
end

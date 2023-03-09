class NoticeComment < ApplicationRecord
  belongs_to :senior
  belongs_to :notice
end

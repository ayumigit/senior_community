class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Senior"
  belongs_to :followed, class_name: "Senior"
end

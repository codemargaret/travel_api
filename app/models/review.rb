class Review < ApplicationRecord
  belongs_to :destination, counter_cache: true
  belongs_to :user
  validates :user_id, :presence => true
  validates :content, :presence => true
  validates :rating, inclusion: { in: 1..5}
  validates :destination_id, :presence => true
end

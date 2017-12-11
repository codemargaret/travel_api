class Review < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  validates :user_id, :presence => true
  validates :content, :presence => true
  validates :rating, :presence => true
  validates :destination_id, :presence => true
end

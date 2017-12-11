class Destination < ApplicationRecord
  has_many :reviews

  scope :featured, -> {
    order('reviews_count DESC')
  }
end

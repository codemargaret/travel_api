class AddReviewsCountToDestinations < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :reviews_count, :integer
  end
end

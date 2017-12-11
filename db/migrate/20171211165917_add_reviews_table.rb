class AddReviewsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :content, :text
      t.column :rating, :integer
      t.column :user_id, :integer
      t.column :destination_id, :integer
    end
  end
end

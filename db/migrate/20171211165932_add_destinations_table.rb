class AddDestinationsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.column :country, :string
      t.column :city, :string
    end
  end
end

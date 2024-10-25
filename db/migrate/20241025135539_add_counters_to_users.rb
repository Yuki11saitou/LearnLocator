class AddCountersToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :reviews_count, :integer, default: 0
    add_column :users, :likes_count, :integer, default: 0
  end
end

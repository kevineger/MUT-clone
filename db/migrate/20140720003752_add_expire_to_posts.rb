class AddExpireToPosts < ActiveRecord::Migration
  def change
    add_column :classified_posts, :expiry, :timestamp
  end
end

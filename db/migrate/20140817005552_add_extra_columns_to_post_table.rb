class AddExtraColumnsToPostTable < ActiveRecord::Migration
  def change
    add_column :classified_posts, :author, :string
    add_column :classified_posts, :edition, :string
    add_column :classified_posts, :isbn, :string
  end
end

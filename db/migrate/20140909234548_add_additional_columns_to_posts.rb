class AddAdditionalColumnsToPosts < ActiveRecord::Migration
  def change
	add_column :classified_posts, :image_file_name, :string
	add_column :classified_posts, :image_content_type, :string
	add_column :classified_posts, :image_file_size, :integer
	add_column :classified_posts, :image_update_at, :datetime
  end
end

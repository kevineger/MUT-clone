class AddAttachmentImageToClassifiedPosts < ActiveRecord::Migration
  def self.up
    change_table :classified_posts do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :classified_posts, :image
  end
end

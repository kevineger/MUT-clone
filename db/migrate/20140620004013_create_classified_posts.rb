class CreateClassifiedPosts < ActiveRecord::Migration
  def change
    create_table :classified_posts do |t|
      t.string :title
      t.string :description
      t.string :image
      t.decimal :price, :precision => 18, :scale => 2
      t.belongs_to :user
      t.belongs_to :classified_category
      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :classified_post
      t.integer :user_id
      t.timestamps
    end
  end
end

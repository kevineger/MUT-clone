class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :name
      t.string :subject
      t.string :classified_post_id
      t.timestamps
    end
  end
end

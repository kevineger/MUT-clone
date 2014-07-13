class CreateUsersConversationsJoinTable < ActiveRecord::Migration
  def change
    create_table :users_conversations do |t|
      t.integer :message_id
      t.integer :user_id
    end
  end
end

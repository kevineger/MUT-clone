class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :body
      t.integer :user_id
      t.integer :conversation_id
      t.timestamps
    end
  end
end

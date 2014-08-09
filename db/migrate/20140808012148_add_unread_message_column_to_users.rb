class AddUnreadMessageColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unread, :boolean
  end
end

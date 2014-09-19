class ChangeOrCreateAdminColumnToUsers < ActiveRecord::Migration
  def change
    if column_exists? :users, :forem_admin
      change_column :users, :forem_admin, :admin
    else
      add_column :users, :admin, :boolean
    end
  end
end

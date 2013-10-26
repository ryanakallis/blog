class AddUserToPost < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :reference
  end
end

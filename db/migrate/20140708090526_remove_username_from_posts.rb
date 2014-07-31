class RemoveUsernameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :username
    remove_column :comments, :username
  end
end

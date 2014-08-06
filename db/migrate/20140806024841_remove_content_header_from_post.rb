class RemoveContentHeaderFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :content_header
  end
end

class RenameHeaderFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :header
    add_column :posts, :type_id, :integer
  end
end

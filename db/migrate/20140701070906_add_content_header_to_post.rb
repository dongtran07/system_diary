class AddContentHeaderToPost < ActiveRecord::Migration
  def change
    add_column :posts, :content_header, :string
  end
end

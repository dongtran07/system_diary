class AddPageViewToPost < ActiveRecord::Migration
  def change
    add_column :posts, :page_view, :integer, default: 0
  end
end

class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :header
      t.text :content
      t.text :username

      t.timestamps
    end
  end
end

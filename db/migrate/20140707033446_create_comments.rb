class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.text :body
      t.integer :post_id

      t.timestamps
    end
  end
end

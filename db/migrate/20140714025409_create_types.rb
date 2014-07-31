class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.string :class_icon
      t.string :bg_class

      t.timestamps
    end
  end
end

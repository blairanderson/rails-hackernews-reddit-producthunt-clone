class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end

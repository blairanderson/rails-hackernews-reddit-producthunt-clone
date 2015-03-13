class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :crypted_password
      t.string :salt
      t.boolean :admin, default: false, null: false
      t.boolean :disabled, default: false, null: false
      t.integer :karma, default: 0, null: false
      t.text :about
      t.string :auth
      t.string :token
      t.datetime :karma_increment_time
      t.datetime :pwd_reset
      t.integer :replies_count, default: 0, null: false

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, [:auth , :token]
  end
end

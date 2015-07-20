class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :password_digest, unique: true
  end
end

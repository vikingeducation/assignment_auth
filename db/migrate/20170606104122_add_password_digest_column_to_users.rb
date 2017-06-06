class AddPasswordDigestColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_digest, :string
    add_index :users, :password_digest
  end
end

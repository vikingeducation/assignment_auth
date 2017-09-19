class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :password
    add_column    :users, :password, :string
  end
end

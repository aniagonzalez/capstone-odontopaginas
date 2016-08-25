class AddUidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :url, :string
    add_column :users, :image, :string
    add_column :users, :first_name, :string
  end
end

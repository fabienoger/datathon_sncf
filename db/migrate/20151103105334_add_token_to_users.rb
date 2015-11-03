class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :netatmo_token, :string
  end
end

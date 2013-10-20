class UserAddGuestFields < ActiveRecord::Migration
  def change
    add_column :users, :evercookie, :string
    add_column :users, :guest, :boolean, default: false
  end
end

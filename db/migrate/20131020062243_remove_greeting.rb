class RemoveGreeting < ActiveRecord::Migration
  def change
    remove_column :cards, :greeting
  end
end

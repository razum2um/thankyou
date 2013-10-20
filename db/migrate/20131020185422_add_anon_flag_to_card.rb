class AddAnonFlagToCard < ActiveRecord::Migration
  def change
    add_column :cards, :anonymously, :boolean, default: true
  end
end

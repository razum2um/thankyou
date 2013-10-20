class AddBgPosToCard < ActiveRecord::Migration
  def change
    add_column :cards, :background_position_x, :integer, default: 0
    add_column :cards, :background_position_y, :integer, default: 0
  end
end

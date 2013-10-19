class AddBackgroudForCard < ActiveRecord::Migration
  def change
    add_column :cards, :img_url, :string
    add_column :cards, :img_height, :integer
    add_column :cards, :img_width, :integer
    add_column :cards, :tb_url, :string
    add_column :cards, :tb_height, :integer
    add_column :cards, :tb_width, :integer
  end
end

class AddAuthorIdToCard < ActiveRecord::Migration
  def change
    add_column :cards, :author_id, :integer
    add_index :cards, :author_id
  end
end

class RecreateCards < ActiveRecord::Migration
  def up
    execute 'drop table if EXISTS cards'
    create_table :cards, { id: false } do |t|
      t.primary_key :id, :uuid
      t.boolean :public, default: true
      t.string :greeting
      t.text :message
      t.references :user, index: true

      t.timestamps
    end
  end

  def down

  end
end

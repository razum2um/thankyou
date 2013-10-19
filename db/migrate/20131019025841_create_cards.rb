class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :greeting
      t.text :message
      t.references :user, index: true

      t.timestamps
    end
  end
end

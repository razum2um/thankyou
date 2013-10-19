class CreateUserTokens < ActiveRecord::Migration
  def change
    create_table :user_tokens do |t|
      t.string :provider
      t.string :uid
      t.references :user, index: true

      t.timestamps
    end
  end
end

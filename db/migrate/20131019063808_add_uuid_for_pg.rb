class AddUuidForPg < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
  end

  def down
    execute 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end

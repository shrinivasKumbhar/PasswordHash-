class CreateMyViews < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW my_view AS
        SELECT  username
        FROM users
    SQL
  end

  def down
    execute 'DROP VIEW my_view'
  end
end

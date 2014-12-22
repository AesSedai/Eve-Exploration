class TableNamesToSnake < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.tables.each do |table|
      t = table.singularize.underscore
      rename_table table, t
    end
  end
end

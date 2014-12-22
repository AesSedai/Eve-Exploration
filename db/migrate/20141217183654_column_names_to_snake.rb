class ColumnNamesToSnake < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.columns(table).each do |c|
        rename_column table, c.name, c.name.underscore
      end
    end
  end
end

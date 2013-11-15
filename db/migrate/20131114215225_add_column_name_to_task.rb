class AddColumnNameToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :flagged, :boolean
  end
end

class AddColumnNameToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :flagged, :boolean, default: false
  end
end

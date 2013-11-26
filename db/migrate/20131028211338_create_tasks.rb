class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :status, default: 0

      t.timestamps
    end
  end
end

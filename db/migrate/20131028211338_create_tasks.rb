class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.string :status, default: TaskStatus.open, null: false

      t.timestamps
    end
  end
end



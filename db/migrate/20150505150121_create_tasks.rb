class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status, default: "incomplete"
      t.date :due_date
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

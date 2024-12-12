class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.boolean :completed, default: false
      t.string :class_name
      t.integer :list_number, null: false, foreign_key: { to_table: :lists }, index: true  # Correctly references list_number
      t.references :school_year, null: false, foreign_key: true
      t.date :due_date
      t.timestamps
    end
  end
end


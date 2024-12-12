class AddIndexToTasksListNumberAndDueDate < ActiveRecord::Migration[7.2]
  def change
    add_index :tasks, [:list_number, :due_date], name: "index_tasks_on_list_number_and_due_date"
  end
end

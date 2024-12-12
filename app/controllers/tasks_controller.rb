# app/controllers/tasks_controller.rb

class TasksController < ApplicationController
    before_action :set_school_year
    before_action :set_list
    before_action :set_task, only: [:show, :edit, :update, :destroy]
  
    # GET /school_years/:school_year_id/lists/:list_id/tasks
    def index
      # Determine the sorting order based on the `sort` parameter
      sort_order = params[:sort] == "desc" ? "DESC" : "ASC"
      
      # Fetch tasks with prepared statement ordering by due_date
      @tasks = @list.tasks.order("due_date #{sort_order}")
    end
  
    # GET /school_years/:school_year_id/lists/:list_id/tasks/:id
    def show
    end
  
    # GET /school_years/:school_year_id/lists/:list_id/tasks/new
    def new
      @task = @list.tasks.new
    end
  
    # POST /school_years/:school_year_id/lists/:list_id/tasks
    def create
      @task = @list.tasks.new(task_params)
      @task.school_year = @school_year
  
      if @task.save
        redirect_to school_year_list_task_path(@school_year, @list, @task), notice: "Task created successfully."
      else
        render :new
      end
    end
  
    # GET /school_years/:school_year_id/lists/:list_id/tasks/:id/edit
    def edit
    end
  
    # PATCH/PUT /school_years/:school_year_id/lists/:list_id/tasks/:id
    def update
      if @task.update(task_params)
        redirect_to school_year_list_task_path(@school_year, @list, @task), notice: "Task updated successfully."
      else
        render :edit
      end
    end
  
    # DELETE /school_years/:school_year_id/lists/:list_id/tasks/:id
    def destroy
      @task.destroy
      redirect_to school_year_list_tasks_path(@school_year, @list), notice: "Task deleted successfully."
    end
  
    private
  
    # Find the parent school year based on the `school_year_id` in the URL
    def set_school_year
      @school_year = SchoolYear.find(params[:school_year_id])
    end
  
    # Find the parent list based on the `list_id` in the URL
    def set_list
      @list = @school_year.lists.find(params[:list_id])
    end
  
    # Find the specific task based on the `id` in the URL
    def set_task
      @task = @list.tasks.find(params[:id])
    end
  
    # Strong parameters for task creation and updates
    def task_params
      params.require(:task).permit(:title, :description, :completed, :class_name, :due_date)
    end
end

class ListsController < ApplicationController
  before_action :set_school_year
  before_action :set_list, only: [:edit, :update, :destroy]

  def index
    @lists = @school_year.lists
  end

  # Redirect show action to the tasks page for the list
  def show
    redirect_to school_year_list_tasks_path(@school_year, params[:id])
  end

  def new
    @list = @school_year.lists.new
  end

  def create
    @list = @school_year.lists.new(list_params)
    if @list.save
      redirect_to school_year_list_tasks_path(@school_year, @list), notice: "List created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to school_year_list_tasks_path(@school_year, @list), notice: "List updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to school_year_lists_path(@school_year), notice: "List deleted successfully."
  end

  private

  def set_school_year
    @school_year = SchoolYear.find(params[:school_year_id])
  end

  def set_list
    @list = @school_year.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :list_number)
  end
end
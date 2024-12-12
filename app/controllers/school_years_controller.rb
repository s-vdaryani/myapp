# app/controllers/school_years_controller.rb

class SchoolYearsController < ApplicationController
    def index
      @school_years = SchoolYear.all
    end
  
    def show
      @school_year = SchoolYear.find(params[:id])
      @lists = @school_year.lists  # Fetch the associated lists
    end
  
    def new
      @school_year = SchoolYear.new
    end
  
    def create
      @school_year = SchoolYear.new(school_year_params)
      if @school_year.save
        redirect_to school_years_path, notice: "School year created successfully."
      else
        render :new
      end
    end
  
    def edit
      @school_year = SchoolYear.find(params[:id])
    end
  
    def update
      @school_year = SchoolYear.find(params[:id])
      if @school_year.update(school_year_params)
        redirect_to school_year_path(@school_year), notice: "School year updated successfully."
      else
        render :edit
      end
    end
  
    def destroy
      @school_year = SchoolYear.find(params[:id])
      @school_year.destroy
      redirect_to school_years_path, notice: "School year deleted successfully."
    end
  
    private
  
    def school_year_params
      params.require(:school_year).permit(:name, :start_date, :end_date)
    end
  end
  
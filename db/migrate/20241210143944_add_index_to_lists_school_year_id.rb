class AddIndexToListsSchoolYearId < ActiveRecord::Migration[7.2]
  def change
    unless index_exists?(:lists, :school_year_id, name: "index_lists_on_school_year_id")
      add_index :lists, :school_year_id, name: "index_lists_on_school_year_id"
    end
  end
end

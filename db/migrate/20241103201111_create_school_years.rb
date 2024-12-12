class CreateSchoolYears < ActiveRecord::Migration[7.2]
  def change
    create_table :school_years do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end

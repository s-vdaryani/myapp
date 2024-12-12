# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# db/seeds.rb

# db/seeds.rb

# Clear existing data to avoid duplication
Task.destroy_all
List.destroy_all
SchoolYear.destroy_all

# Create a School Year
school_year = SchoolYear.create!(
  name: "2023-2024",
  start_date: Date.new(2023, 8, 1),
  end_date: Date.new(2024, 5, 31)
)

# Create Lists associated with the School Year
list1 = school_year.lists.create!(name: "Semester 1 Assignments", list_number: 1)
list2 = school_year.lists.create!(name: "Semester 2 Assignments", list_number: 2)

# Create Tasks associated with each List, using list_number instead of list_id
Task.create!(title: "Math Homework 1", description: "Complete chapters 1-3", completed: false, class_name: "Math", list_number: list1.list_number, school_year_id: school_year.id, due_date: Date.today + 7)
Task.create!(title: "English Essay", description: "Write an essay on modern literature", completed: false, class_name: "English", list_number: list1.list_number, school_year_id: school_year.id, due_date: Date.today + 14)

Task.create!(title: "Science Project", description: "Prepare the model for science fair", completed: false, class_name: "Science", list_number: list2.list_number, school_year_id: school_year.id, due_date: Date.today + 30)
Task.create!(title: "History Presentation", description: "Prepare slides on WWII", completed: false, class_name: "History", list_number: list2.list_number, school_year_id: school_year.id, due_date: Date.today + 21)

puts "Dummy data seeded successfully!"


class Task < ApplicationRecord
    # Relationships
    belongs_to :list, foreign_key: :list_number, primary_key: :list_number
    belongs_to :school_year
  
    # Validations
    validates :title, presence: true
    validates :description, presence: true
    validates :due_date, presence: true
    validates :class_name, presence: true
    validates :completed, inclusion: { in: [true, false] }
  end
  
  
class SchoolYear < ApplicationRecord
    # Relationships
    has_many :lists, dependent: :destroy
    has_many :tasks, through: :lists
  
    # Validations (optional, add if needed)
    validates :name, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
end
class List < ApplicationRecord
    # Relationships
    has_many :tasks, foreign_key: :list_number, primary_key: :list_number
    belongs_to :school_year
  
    # Validations
    validates :name, presence: true
    validates :list_number, presence: true, uniqueness: true
  end
  
  

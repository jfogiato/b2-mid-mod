class Department < ApplicationRecord
  validates_presence_of :name, :floor

  has_many :department_employees
  has_many :employees, through: :department_employees
end
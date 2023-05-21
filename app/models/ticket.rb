class Ticket < ApplicationRecord
  validates_presence_of :subject, :age

  has_many :ticket_employees
  has_many :employees, through: :ticket_employees
end
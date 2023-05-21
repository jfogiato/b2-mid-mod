class Employee < ApplicationRecord
  validates_presence_of :name, :level, :department_id

  belongs_to :department

  has_many :ticket_employees
  has_many :tickets, through: :ticket_employees

  def ordered_tickets
    tickets.order(age: :desc)
  end
end
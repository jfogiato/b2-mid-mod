class EmployeesController < ApplicationController
  def show
    @employee = Employee.find(params[:id])
  end

  def add_ticket
    employee = Employee.find(params[:id])
    ticket = Ticket.find(params[:ticket_id])
    employee.tickets << ticket
    redirect_to "/employees/#{employee.id}"
  end
end
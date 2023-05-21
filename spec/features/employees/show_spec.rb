require 'rails_helper'

RSpec.describe '/employees/id' do

  let!(:department_1) { Department.create!(name: "Accounting", floor: 1) }

  let!(:employee_1) { Employee.create!(name: "John Doe", level: 1, department_id: department_1.id) }

  let!(:department_employee_1) { DepartmentEmployee.create!(department: department_1, employee: employee_1) }

  let!(:ticket_1) { Ticket.create!(subject: "Ticket 1", age: 5) }
  let!(:ticket_2) { Ticket.create!(subject: "Ticket 2", age: 10) }
  let!(:ticket_3) { Ticket.create!(subject: "Ticket 3", age: 2) }
  let!(:ticket_4) { Ticket.create!(subject: "Ticket 4", age: 18) }
  # Saving this ticket to add via form
  let!(:ticket_5) { Ticket.create!(subject: "Ticket 5", age: 9) }

  let!(:ticket_employee_1) { TicketEmployee.create!(ticket: ticket_1, employee: employee_1) }
  let!(:ticket_employee_2) { TicketEmployee.create!(ticket: ticket_2, employee: employee_1) }
  let!(:ticket_employee_3) { TicketEmployee.create!(ticket: ticket_3, employee: employee_1) }
  let!(:ticket_employee_4) { TicketEmployee.create!(ticket: ticket_4, employee: employee_1) }

  before :each do
    visit "/employees/#{employee_1.id}"
  end

  it "can see the employee's name" do
    expect(page).to have_content(employee_1.name)
  end

  it "can see the employee's department" do
    expect(page).to have_content(department_1.name)
  end

  it "can see a list of all of the employee's tickets from oldest to newest" do
    expect(page).to have_content(ticket_3.subject)
    expect(page).to have_content(ticket_1.subject)
    expect(page).to have_content(ticket_2.subject)
    expect(page).to have_content(ticket_4.subject)
  end

  it "can see a form to add a ticket to this employee" do
    expect(page).to have_field("ticket_id")
  end

  it "can add a ticket to this employee" do
    fill_in "ticket_id", with: ticket_5.id
    click_button "Add Ticket"

    expect(current_path).to eq("/employees/#{employee_1.id}")
    expect(page).to have_content(ticket_5.subject)
  end

end
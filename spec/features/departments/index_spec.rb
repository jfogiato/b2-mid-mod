require 'rails_helper'

RSpec.describe "/departments", type: :feature do

  let!(:department_1) { Department.create!(name: "Accounting", floor: 1) }
  let!(:department_2) { Department.create!(name: "Engineering", floor: 2) }

  let!(:employee_1) { Employee.create!(name: "John Doe", level: 1, department_id: department_1.id) }
  let!(:employee_2) { Employee.create!(name: "Jane Doe", level: 2, department_id: department_1.id) }
  let!(:employee_3) { Employee.create!(name: "John Smith", level: 3, department_id: department_1.id) }
  let!(:employee_4) { Employee.create!(name: "Jane Smith", level: 4, department_id: department_2.id) }
  let!(:employee_5) { Employee.create!(name: "John Doe Jr.", level: 5, department_id: department_2.id) }
  let!(:employee_6) { Employee.create!(name: "Jane Doe Jr.", level: 6, department_id: department_2.id) }

  let!(:department_employee_1) { DepartmentEmployee.create!(department: department_1, employee: employee_1) }
  let!(:department_employee_2) { DepartmentEmployee.create!(department: department_1, employee: employee_2) }
  let!(:department_employee_3) { DepartmentEmployee.create!(department: department_1, employee: employee_3) }
  let!(:department_employee_4) { DepartmentEmployee.create!(department: department_2, employee: employee_4) }
  let!(:department_employee_5) { DepartmentEmployee.create!(department: department_2, employee: employee_5) }
  let!(:department_employee_6) { DepartmentEmployee.create!(department: department_2, employee: employee_6) }


  before :each do
    visit "/departments"
  end
    

  it "can see all departments name and floor" do

    expect(page).to have_content(department_1.name)
    expect(page).to have_content(department_2.name)
    expect(page).to have_content(department_1.floor)
    expect(page).to have_content(department_2.floor)

  end

  it "can see the names of all employees in that department" do
    within("p#employee-#{employee_1.id}") do
      expect(page).to have_content("John Doe")
    end
    
    within("p#employee-#{employee_2.id}") do
      expect(page).to have_content("Jane Doe")
    end
  end

end
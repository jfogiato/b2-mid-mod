class CreateDepartmentEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :department_employees do |t|
      t.references :department, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

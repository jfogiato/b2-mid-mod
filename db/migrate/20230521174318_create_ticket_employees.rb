class CreateTicketEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :ticket_employees do |t|
      t.references :ticket, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end

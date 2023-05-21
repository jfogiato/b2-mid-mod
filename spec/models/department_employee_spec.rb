require 'rails_helper'

RSpec.describe DepartmentEmployee, type: :model do
  describe "relationships" do
    it { should belong_to :department }
    it { should belong_to :employee }
  end
end
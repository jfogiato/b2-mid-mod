require "rails_helper"

RSpec.describe Employee, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :level }
    it { should validate_presence_of :department_id }
  end

  describe "relationships" do
    it { should belong_to :department }
    it { should have_many :tickets }
  end
end
require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'when employee is valid' do
    let(:employee) { build(:employee) }

    it 'is valid with all attributes' do
      expect(employee).to be_valid
    end
  end

  context 'when employee is invalid' do
    it 'is invalid without email attribute' do
      employee = build(:employee, email: nil)
      employee.valid?
      expect(employee.errors.full_messages).to include("Email can't be blank")
    end

    it 'is invalid without first name attribute' do
      employee = build(:employee, first_name: nil)
      employee.valid?
      expect(employee.errors.full_messages).to include("First name can't be blank")
    end

    it 'is invalid without last name attribute' do
      employee = build(:employee, last_name: nil)
      employee.valid?
      expect(employee.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is invalid without department attribute' do
      employee = build(:employee, department: nil)
      employee.valid?
      expect(employee.errors.full_messages).to include("Department can't be blank")
    end

    it 'is invalid without salary attribute' do
      employee = build(:employee, salary: nil)
      employee.valid?
      expect(employee.errors.full_messages).to include("Salary can't be blank")
    end
  end
end

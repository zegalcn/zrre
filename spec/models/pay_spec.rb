require 'rails_helper'

RSpec.describe Pay, type: :model do
  context " " do
    it "" do
      employee = create(:employee)
      pay = Pay.create!(employee: employee, department: employee.department, category: create(:pay_category), sum: 100, year: 2022, month: 4)
    end
  end
end

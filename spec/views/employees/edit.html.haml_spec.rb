require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  before(:each) do
    @employee = assign(:employee, Employee.create!(
      name: "MyString",
      mode: 1,
      description: "MyText"
    ))
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(@employee), "post" do

      assert_select "input[name=?]", "employee[name]"

      assert_select "input[name=?]", "employee[mode]"

      assert_select "textarea[name=?]", "employee[description]"
    end
  end
end

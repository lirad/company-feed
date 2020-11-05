require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, Sale.new(
      user: nil,
      value: "9.99",
      comment: "MyString"
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[user_id]"

      assert_select "input[name=?]", "sale[value]"

      assert_select "input[name=?]", "sale[comment]"
    end
  end
end

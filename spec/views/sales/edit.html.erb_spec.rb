require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @sale = assign(:sale, Sale.create!(
      user: nil,
      value: "9.99",
      comment: "MyString"
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input[name=?]", "sale[user_id]"

      assert_select "input[name=?]", "sale[value]"

      assert_select "input[name=?]", "sale[comment]"
    end
  end
end

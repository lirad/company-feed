require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    assign(:sales, [
      Sale.create!(
        user: nil,
        value: "9.99",
        comment: "Comment"
      ),
      Sale.create!(
        user: nil,
        value: "9.99",
        comment: "Comment"
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Comment".to_s, count: 2
  end
end

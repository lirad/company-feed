require 'rails_helper'

RSpec.describe "opinions/new", type: :view do
  before(:each) do
    assign(:opinion, Opinion.new(
      AuthorId: 1,
      Text: "MyString"
    ))
  end

  it "renders new opinion form" do
    render

    assert_select "form[action=?][method=?]", opinions_path, "post" do

      assert_select "input[name=?]", "opinion[AuthorId]"

      assert_select "input[name=?]", "opinion[Text]"
    end
  end
end

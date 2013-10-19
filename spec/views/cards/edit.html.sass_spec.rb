require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :greeting => "MyString",
      :message => "MyText",
      :user => nil
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", card_path(@card), "post" do
      assert_select "input#card_greeting[name=?]", "card[greeting]"
      assert_select "textarea#card_message[name=?]", "card[message]"
      assert_select "input#card_user[name=?]", "card[user]"
    end
  end
end

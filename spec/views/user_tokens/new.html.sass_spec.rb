require 'spec_helper'

describe "user_tokens/new" do
  before(:each) do
    assign(:user_token, stub_model(UserToken,
      :provider => "MyString",
      :uid => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new user_token form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_tokens_path, "post" do
      assert_select "input#user_token_provider[name=?]", "user_token[provider]"
      assert_select "input#user_token_uid[name=?]", "user_token[uid]"
      assert_select "input#user_token_user[name=?]", "user_token[user]"
    end
  end
end

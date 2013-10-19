require 'spec_helper'

describe "user_tokens/edit" do
  before(:each) do
    @user_token = assign(:user_token, stub_model(UserToken,
      :provider => "MyString",
      :uid => "MyString",
      :user => nil
    ))
  end

  it "renders the edit user_token form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_token_path(@user_token), "post" do
      assert_select "input#user_token_provider[name=?]", "user_token[provider]"
      assert_select "input#user_token_uid[name=?]", "user_token[uid]"
      assert_select "input#user_token_user[name=?]", "user_token[user]"
    end
  end
end

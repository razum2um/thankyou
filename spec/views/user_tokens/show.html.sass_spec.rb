require 'spec_helper'

describe "user_tokens/show" do
  before(:each) do
    @user_token = assign(:user_token, stub_model(UserToken,
      :provider => "Provider",
      :uid => "Uid",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Provider/)
    rendered.should match(/Uid/)
    rendered.should match(//)
  end
end

require 'spec_helper'

describe "user_tokens/index" do
  before(:each) do
    assign(:user_tokens, [
      stub_model(UserToken,
        :provider => "Provider",
        :uid => "Uid",
        :user => nil
      ),
      stub_model(UserToken,
        :provider => "Provider",
        :uid => "Uid",
        :user => nil
      )
    ])
  end

  it "renders a list of user_tokens" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

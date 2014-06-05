require 'spec_helper'

describe "user_stories/show" do
  before(:each) do
    @user_story = assign(:user_story, stub_model(UserStory,
      :user_id => 1,
      :story_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end

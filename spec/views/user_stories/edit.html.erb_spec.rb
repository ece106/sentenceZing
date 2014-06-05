require 'spec_helper'

describe "user_stories/edit" do
  before(:each) do
    @user_story = assign(:user_story, stub_model(UserStory,
      :user_id => 1,
      :story_id => 1
    ))
  end

  it "renders the edit user_story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_story_path(@user_story), "post" do
      assert_select "input#user_story_user_id[name=?]", "user_story[user_id]"
      assert_select "input#user_story_story_id[name=?]", "user_story[story_id]"
    end
  end
end

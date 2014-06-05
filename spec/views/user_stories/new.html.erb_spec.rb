require 'spec_helper'

describe "user_stories/new" do
  before(:each) do
    assign(:user_story, stub_model(UserStory,
      :user_id => 1,
      :story_id => 1
    ).as_new_record)
  end

  it "renders new user_story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", user_stories_path, "post" do
      assert_select "input#user_story_user_id[name=?]", "user_story[user_id]"
      assert_select "input#user_story_story_id[name=?]", "user_story[story_id]"
    end
  end
end

require 'spec_helper'

describe "sessions/new" do
  before(:each) do
    assign(:session, stub_model(Session,
      :new => "MyString",
      :create => "MyString",
      :destroy => "MyString"
    ).as_new_record)
  end

  it "renders new session form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sessions_path, "post" do
      assert_select "input#session_new[name=?]", "session[new]"
      assert_select "input#session_create[name=?]", "session[create]"
      assert_select "input#session_destroy[name=?]", "session[destroy]"
    end
  end
end

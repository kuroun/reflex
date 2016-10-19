require 'rails_helper'

RSpec.describe "stories/new", type: :view do
  before(:each) do
    assign(:story, Story.new(
      :title => "MyString",
      :content => "MyText",
      :positive => 1,
      :negative => 1
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_content[name=?]", "story[content]"

      assert_select "input#story_positive[name=?]", "story[positive]"

      assert_select "input#story_negative[name=?]", "story[negative]"
    end
  end
end

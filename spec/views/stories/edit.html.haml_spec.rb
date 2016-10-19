require 'rails_helper'

RSpec.describe 'stories/edit', type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
                              title: 'MyString',
                              content: 'MyText',
                              positive: 1,
                              negative: 1
    ))
  end

  it 'renders the edit story form' do
    render

    assert_select 'form[action=?][method=?]', story_path(@story), 'post' do
      assert_select 'input#story_title[name=?]', 'story[title]'

      assert_select 'input#story_content[name=?]', 'story[content]'

      assert_select 'input#story_positive[name=?]', 'story[positive]'

      assert_select 'input#story_negative[name=?]', 'story[negative]'
    end
  end
end

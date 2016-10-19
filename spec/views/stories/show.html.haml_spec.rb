require 'rails_helper'

RSpec.describe 'stories/show', type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
                              title: 'Title',
                              content: 'MyText',
                              positive: 2,
                              negative: 3
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end

require 'spec_helper'

describe "/posts/index.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :title => "value for title",
        :permalink => "value for permalink",
        :body => "value for body"
      ),
      stub_model(Post,
        :title => "value for title",
        :permalink => "value for permalink",
        :body => "value for body"
      )
    ]
  end

  it "renders a list of posts" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for permalink".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
  end
end

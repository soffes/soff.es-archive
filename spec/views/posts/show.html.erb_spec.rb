require 'spec_helper'

describe "/posts/show.html.erb" do
  include PostsHelper
  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :title => "value for title",
      :permalink => "value for permalink",
      :body => "value for body"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ permalink/)
    response.should have_text(/value\ for\ body/)
  end
end

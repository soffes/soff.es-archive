require 'spec_helper'

describe "/posts/edit.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false,
      :title => "value for title",
      :permalink => "value for permalink",
      :body => "value for body"
    )
  end

  it "renders the edit post form" do
    render

    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_title[name=?]', "post[title]")
      with_tag('input#post_permalink[name=?]', "post[permalink]")
      with_tag('textarea#post_body[name=?]', "post[body]")
    end
  end
end

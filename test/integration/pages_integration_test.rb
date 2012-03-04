require 'test_helper'

describe 'Page integration' do
  it 'should show about page' do
    visit about_path
    page.text.must_include('About')
  end

  it 'should show music page' do
    visit music_path
    page.text.must_include('Music')
  end

  it 'should show talks page' do
    visit talks_path
    page.text.must_include('Talks')
  end
end

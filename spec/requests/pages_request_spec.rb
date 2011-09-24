require 'spec_helper'

describe 'Page request' do
  it 'should show about page' do
    visit about_path
    page.should have_content('About')
  end

  it 'should show music page' do
    visit music_path
    page.should have_content('Music')
  end

  it 'should show talks page' do
    visit talks_path
    page.should have_content('Talks')
  end
end

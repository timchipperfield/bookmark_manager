require 'spec_helper'

feature 'Adding tags to links' do
  scenario 'I can add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'butdoesitfloat.com'
    fill_in 'title', with: 'but does it float'
    fill_in 'tags', with: 'art'
    click_button 'Create link'
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'art'
    end
  end
end
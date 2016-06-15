require 'spec_helper'

feature 'present a list of links on page' do
  scenario 'seeing links on the link page' do
    Link.create(title: 'Makers Academy' , url:'http://www.makersacademy.com')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  before(:each) do
    Link.create(title: 'Makers Academy', url: 'http://www.makersacademy.com', tags: [Tag.first_or_create(name: 'education')])
    Link.create(title: 'Google', url: 'http://www.google.com', tags: [Tag.first_or_create(name: 'search_engine')])
  end

  scenario 'filtering links by tag' do
    visit '/tags/search_engine'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('Google')
      expect(page).not_to have_content('Makers Academy')
    end
  end
end

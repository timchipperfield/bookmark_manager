require 'spec_helper'

feature 'present a list of links on page' do
  scenario 'seeing links on the link page' do
    Link.create(title: 'Makers Academy' , url:'http://www.makersacademy.com')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_cotent('Makers Academy')
    end
  end
end

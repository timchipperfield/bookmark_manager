require 'capybara/rspec'

feature 'View links' do
  scenario 'I can see links on the page' do
  	Link.create(url: 'https://www.bbc.com', title: "BBC")
  	visit '/links'
  	expect(page.status_code).to eq 200
  	within 'ul#links' do
  	expect(page).to have_content("BBC") 		
  	end
  end
end

feature 'filters' do

  before(:each) do
  	Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'eduction')])
  	Link.create(url: 'http://www.artparasites.com', title: 'Art Parasites', tags: [Tag.first_or_create(name: 'art')])
  	Link.create(url: 'http://www.butdoesitfloat.com', title: 'But Does it Float', tags: [Tag.first_or_create(name: 'art')])
  end

  scenario 'I can filter links by tags' do
  	visit '/tags/art'

  	expect(page.status_code).to eq(200)
  	within 'ul#links' do
  	  expect(page).not_to have_content('Makers Academy')
  	  expect(page).to have_content('Art Parasites')
  	  expect(page).to have_content('But Does it Float')
  	end
  end
end
feature 'creating links' do
	scenario 'adding a new link with title and url' do
		visit ('/links/new')
		fill_in :title, with: 'Makers Academy'
		fill_in :url, with: 'www.makersacademy.com'
		click_button 'Submit'
		expect(page).to have_content 'Makers Academy'
		end
end

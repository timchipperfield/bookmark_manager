feature 'Adding tags' do
  scenario 'so I can add a single tag to a new link' do
    visit('/links/new')
    fill_in('title', with: 'Google')
    fill_in('url', with: 'http://www.google.com')
    fill_in('tags', with: 'search_engine news')

    click_button('Submit')
    link = Link.first
    expect(link.tags.map(&:name)).to include('search_engine', 'news')
  end


end

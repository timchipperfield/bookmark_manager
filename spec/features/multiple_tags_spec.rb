feature "multiple tags" do

  scenario "allow more than one tag per link" do

    visit '/links/new'
    fill_in 'url', with: 'artparasites.com'
    fill_in 'title', with: 'Art Parasites'
    fill_in 'tags', with: 'art berlin'
    click_button('Create link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('art', 'berlin')

  end
end
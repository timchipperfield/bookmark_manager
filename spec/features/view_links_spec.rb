# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of links on the homepage

feature 'view links' do
  scenario 'view list of links on homepage' do
    Link.create(url: 'http://www.salamanca24horas.com', title: 'Noticias Salamanca')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Salamanca')
    end
  end
end

require_relative '../web_helper.rb'

feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, poppy@email.com')
    expect(User.first.email).to eq('poppy@email.com')
  end
end
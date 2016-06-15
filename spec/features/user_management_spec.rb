require 'web_helper'

feature 'User accounts' do
  scenario 'new users can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, John@hotmail.com')
    expect(User.first.email).to eq('John@hotmail.com')
  end
end

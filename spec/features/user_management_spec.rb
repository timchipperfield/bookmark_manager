require_relative '../web_helper.rb'

feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, poppy@email.com')
    expect(User.first.email).to eq('poppy@email.com')
  end

  scenario "requires a matching password confirmation" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and password confirmation do not match')
  end

  scenario "I cannot sign up without email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario "I cannot sign up with invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  def sign_up(email: 'poppy@email.com', password: '1234', password_confirmation: '1234')
    visit('/users/new')
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
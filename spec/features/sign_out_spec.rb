feature "user signs out" do
before(:each) do
    User.create(email: 'user@example.com',
      password: '12345',
      password_confirmation: '12345')
  end

  scenario "while being signed in" do
    sign_in(email: 'user@example.com',
      password: '12345')
    click_button "Sign out"
    expect(page).to have_content 'Goodbye!'
    expect(page).not_to have_content 'Welcome, user@example.com'
  end
end
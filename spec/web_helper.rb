def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in(:email,     with: 'John@hotmail.com')
  fill_in(:password,  with: '12345')
  click_button('Sign Up')
end

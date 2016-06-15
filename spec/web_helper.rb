def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in(:email,     with: 'John@hotmail.com')
  fill_in(:password,  with: '12345')
  click_button('Sign Up')
end

def sign_up_user(email: 'John@hotmail.com', password: '12345', password_confirmation: '12345')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in(:email,     with: email)
  fill_in(:password,  with: password)
  fill_in(:password_confirmation,  with: password_confirmation)
  click_button('Sign Up')
end
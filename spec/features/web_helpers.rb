def sign_up(email, password)
  visit '/users/new'
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password)
  click_button('Sign Up')
end

def sign_in(email, password)
  visit '/sessions/new'
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Sign In')
end

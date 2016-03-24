def sign_up(email, password)

  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password)
  click_button('Sign Up')

end

feature 'Invalid email confirmation' do
  scenario 'invalid email raises error' do
    visit '/sign_up'

    fill_in('email', with: 'crap')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')

    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter a valid email address')

  end
end

feature 'Password confirmation' do
  scenario 'mismatched password raises error' do
    p User.all.count

    visit '/'

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'bollocks')
    click_button('Sign Up')

    expect(User.all.count).to eq 0
    expect(page).to have_content('Password and confirmation password do not match')

  end
end

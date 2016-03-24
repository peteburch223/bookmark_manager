feature 'Password confirmation' do
  scenario 'mismatched password raises error' do
    visit '/'

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'bollocks')
    click_button('Sign Up')

    expect(User.all.count).to eq 0

  end
end

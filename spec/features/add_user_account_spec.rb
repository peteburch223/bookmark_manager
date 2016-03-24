feature 'Add user account' do
  scenario 'user signup' do
    visit '/'

    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    click_button('Sign Up')

    expect(User.all.count).to eq 1
    expect(page).to have_content('Welcome, test@example.com')
    user = User.last
    expect(user.email).to eq 'test@example.com'
  end
end

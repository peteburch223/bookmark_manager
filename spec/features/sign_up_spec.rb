require_relative 'web_helpers.rb'

feature 'Add user account' do
  scenario 'user signup' do
    visit '/sign_up'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')

    expect(User.all.count).to eq 1
    expect(page).to have_content('Welcome, test@example.com')
    user = User.last
    expect(user.email).to eq 'test@example.com'
    expect(user.password_hash).not_to eq 'password'
  end
end

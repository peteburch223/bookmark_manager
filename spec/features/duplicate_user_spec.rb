feature 'duplicate user registration' do
  scenario 'Duplicate user registration' do
    visit '/users/new'
    fill_in('email', with: 'adil@adil.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')
    visit '/users/new'
    fill_in('email', with: 'adil@adil.com')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')
    expect(User.all.count).to eq 1
    expect(page).to have_content('This user already exists')
  end
end

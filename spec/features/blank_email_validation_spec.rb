feature 'Blank email confirmation' do
  scenario 'blank email raises error' do

    p User.all.count

    visit '/users/new'

    fill_in('email', with: '')
    fill_in('password', with: 'password')
    fill_in('password_confirmation', with: 'password')
    click_button('Sign Up')
    p User.all.count

    expect(User.all.count).to eq 0
    expect(page).to have_content('Please enter an email address')

  end
end

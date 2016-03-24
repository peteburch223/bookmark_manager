feature 'Sign in' do


  scenario 'user can sign in' do

    email = 'test@test.com'
    password = 'password'

    sign_up(email, password)
    visit '/'
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Sign In')

    expect(page).to have_content("Welcome, #{email}")
  end
end

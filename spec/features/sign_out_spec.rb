require_relative 'web_helpers.rb'

feature 'Sign Out' do
  scenario 'user sign-out' do

    email = 'test@test.com'
    password = 'password'

    sign_up(email, password)
    sign_in(email, password)
    expect(page).to have_content("Welcome, #{email}")

    click_button('Sign Out')

    expect(page).not_to have_content("Welcome, #{email}")
    expect(page).to have_content("Goodbye")
  end
end

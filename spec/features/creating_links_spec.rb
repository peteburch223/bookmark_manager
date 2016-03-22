require 'spec_helper'

feature 'Creating links' do

  scenario 'I can create new links' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links/new'

    expect(page.status_code).to eq 200

    fill_in "title", with: 'BBC'
    fill_in "url",   with: 'http://www.bbc.co.uk'
    click_button('Save')

    expect(current_path).to eq('/links')


    within 'ul#links' do
      expect(page).to have_content('BBC')
    end
  end
end

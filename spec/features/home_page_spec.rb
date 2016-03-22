feature 'View Links on homepage' do
  scenario 'Visits the home page' do
    visit '/'
    expect(page).to have_content 'My-Links'

    within 'ul#links' do
      expect(page).to have_link 'BBC Sports'
    end
  end
end

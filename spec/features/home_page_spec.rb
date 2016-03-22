feature 'View Links on homepage' do
  scenario 'Visits the home page' do
    visit '/'
    expect(page).to have_content 'Bookmarks'

    within 'ul#links' do
      expect(page).to have_link 'BBC Sports'
    end
  end
end
feature 'Add link to BOOKMARKS' do
  scenario 'Click Add Link and submit' do
    visit '/'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    click_button("Save")
      expect(page).to have_link 'NME'

  end
end

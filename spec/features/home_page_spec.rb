

feature 'Add link to BOOKMARKS' do
  scenario 'Click Add Link and submit' do
    visit '/'
    click_button("Add Link")
    fill_in('title', with: 'NME')
    fill_in('href', with: 'http://www.nme.com' )
    fill_in('tags', with: 'news')
    click_button("Save")

    visit '/'
    click_button("Add Link")
    fill_in('title', with: 'Melody Maker')
    fill_in('href', with: 'http://www.melody_maker.com' )
    fill_in('tags', with: 'bubbles')
    click_button("Save")

    visit '/'
    click_button("Add Link")
    fill_in('title', with: 'Smash Hits')
    fill_in('href', with: 'http://www.smash.com' )
    fill_in('tags', with: 'bubbles')
    click_button("Save")

    link = Link.first
    expect(page).to have_link 'Melody Maker'
    expect(link.tags.map(&:name)).to include('news')

  end
end

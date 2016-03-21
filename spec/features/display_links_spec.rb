require 'spec_helper'
feature 'when opening front page' do
  scenario 'displays list of websites' do
    expect(page).to have_content 'google.com'
  end
end

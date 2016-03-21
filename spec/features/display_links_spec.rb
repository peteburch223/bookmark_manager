

require 'spec_helper'

RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

feature 'when opening front page', :broken => true do
  scenario 'displays list of websites' do
    expect(page).to have_content 'google.com'
  end
end

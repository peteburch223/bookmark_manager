require 'spec_helper'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dotenv'

RSpec.configure do |c|
  c.filter_run_excluding :broken => true
end

USER = ENV['USER']
PASSWORD = ENV['PASSWORD']
HOSTNAME = ENV['HOSTNAME']
DATABASE = ENV['DATABASE']

RSpec.configure do
  DataMapper.setup(:default,"postgres://#{USER}:#{PASSWORD}@#{HOSTNAME}/#{DATABASE}")
  DataMapper::Logger.new($stdout, :debug)
end

class Link
  include DataMapper::Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
  property :date,   Date
end

RSpec.configure do
  DataMapper.finalize.auto_upgrade!
end

feature 'when opening front page' do
  scenario 'displays list of websites' do

    visit '/'
    links = Link.all

    p links
    expect(page).to have_content 'google.com'
  end
end

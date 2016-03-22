ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  set :environment, :development
  data_mapper_finalize

  get '/links' do
    @links = Link.all
    p @links
     erb(:'links/index')
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(tag: params[:tag])
    LinkTag.create(link: link, tag: tag)
    redirect('/links')
  end

  get '/links/new' do
    erb(:'links/new')
  end
end

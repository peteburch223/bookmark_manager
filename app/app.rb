require 'sinatra/base'
# require_relative 'models/link'
# require_relative 'models/tag'
require_relative 'models/data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Bookmark < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:home)

  end

  get '/add_link' do
    erb(:add_link)
  end

  post '/new' do
    link = Link.new(title: params[:title], href: params[:href])
    tag = Tag.create(name: params[:tags])
    LinkTag.create(link: link, tag: tag )
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

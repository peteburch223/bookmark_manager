ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/data_mapper_setup'


class Bookmark < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:home)

  end

  get '/add_link' do
    erb(:add_link)
  end

  get '/tags/:name' do
    tag =  Tag.all(name: params[:name])
    @links = tag.links
    erb(:home)
  end

  post '/new' do
    link = Link.create(title: params[:title], href: params[:href])
    Tag.create_tags(LinkTag,link, params[:tags])
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

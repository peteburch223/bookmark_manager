require 'sinatra/base'
require_relative './lib/link'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:home)
  end

  get '/add_link' do

    erb(:add_link)
  end

  post '/new' do
    Link.create(title: params[:title], href: params[:href])
    redirect to('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/data_mapper_setup'


class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    @user.save!
    session[:user_id] = @user.id
    p User.all
    redirect '/links'
  end

  get '/links' do
    @name = session[:me]
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
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

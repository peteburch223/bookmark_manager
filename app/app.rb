ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'

class Bookmark < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  get '/' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    @user.password_confirmation  = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash[:errors] = @user.errors.full_messages
      # flash[:invalid_email] = @user.errors[:email] if @user.errors.on(:email)
      redirect '/'
    end
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

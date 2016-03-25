ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'

class Bookmark < Sinatra::Base
  use Rack::MethodOverride
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

# require_relative 'models/init'
require_relative 'routes/init'

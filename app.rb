require 'sinatra/base'
require_relative './lib/link'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb(:home)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

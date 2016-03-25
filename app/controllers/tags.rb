class Bookmark < Sinatra::Base

  get '/tags/:name' do
    tag =  Tag.all(name: params[:name])
    @links = tag.links
    erb(:'links/index')
  end
end

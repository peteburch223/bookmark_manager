class Bookmark < Sinatra::Base

  get '/links' do
    @name = session[:me]
    @links = Link.all
    erb(:'links/index')
  end

  get '/links/add' do
    erb(:'links/new')
  end

  post '/links/new' do
    link = Link.create(title: params[:title], href: params[:href])
    Tag.create_tags(LinkTag,link, params[:tags])
    redirect to('/links')
  end
end

class Bookmark < Sinatra::Base

  get '/links' do
    @name = session[:me]
    @links = Link.all
    erb(:home)
  end

  get '/links/add' do
    erb(:'links/add')
  end

  get '/tags/:name' do
    tag =  Tag.all(name: params[:name])
    @links = tag.links
    erb(:home)
  end

  post '/links/new' do
    link = Link.create(title: params[:title], href: params[:href])
    Tag.create_tags(LinkTag,link, params[:tags])
    redirect to('/links')
  end
end

class Bookmark < Sinatra::Base

  get '/sessions/new' do
    p session
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.first(:email => params[:email])
    if User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      redirect '/links'
    else
      flash[:errors] = User.errors.full_messages
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    p current_user
    flash.keep[:notice] = "Goodbye"
    redirect ('/links')
  end
end

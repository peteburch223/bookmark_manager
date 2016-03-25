class Bookmark < Sinatra::Base

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    @user.password_confirmation  = params[:password_confirmation]

    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash[:notice] = @user.errors.full_messages
      redirect '/users/new'
    end
  end
end

get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/user/#{@user.id}"
  else
    redirect '/authentication/login'
  end
end

get '/authentication/login' do
  erb :'authentication/login'
end

post '/authentication/login' do
  user = User.find_by(email: params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    redirect '/authentication/login'
  end
end

get '/authentication/signup' do
  erb :'authentication/signup'
end

post '/authentication/signup' do
  @user = User.create(params)
  session[:user_id] = @user.id
  redirect '/'
end

get '/authentication/logout' do
  session[:user_id] = nil
  redirect '/'
end

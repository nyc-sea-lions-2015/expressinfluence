get '/user/:id' do
  @user = User.find(params[:id])
  @contacts = @user.contacts
  erb :'user/home'
end

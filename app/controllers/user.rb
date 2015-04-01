get '/user/:id' do
  @user = User.find(params[:id])
  @contacts = Contact.where(user_id: params[:id])
  erb :'user/home'
end

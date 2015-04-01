get '/contact/search' do

  @industry = params[:industry]
  @contacts = Contact.where(industry: @industry)


    erb :'contact/industry'

end

get '/contact/new' do
  erb :'contact/new'
end

post '/contact/new' do
  @contact = Contact.create(name: params[:name], industry: params[:industry], user_id: session[:user_id])
  Comment.create(content: params[:content], contact_id: @contact.id, user_id: session[:user_id])

  redirect "/contact/#{@contact.id}"
end

get '/contact/:id' do
  @contact = Contact.find(params[:id])
  @comments = Comment.where(contact_id: @contact.id)

  erb :'contact/view'
end

delete '/contact/delete/:id' do
  p params
  p params
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect '/'
end

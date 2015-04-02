get '/contact/search' do
  @contacts = Contact.where(industry: params[:industry])
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

get '/contact/edit/:id' do
  @contact = Contact.find(params[:id])

  erb :'/contact/edit'
end

put '/contact/edit/:id' do

  @contact = Contact.find(params[:id])
  # ORRRRR... you could try .update which takes a hash
  # e.g. .update(name: params[:name]...)
  @contact.industry = params[:industry]
  @contact.name = params[:name]
  @contact.save

  redirect "/contact/#{@contact.id}"
end

delete '/contact/delete/:id' do
  @contact = Contact.find(params[:id])
  @contact.destroy

  redirect '/'
end

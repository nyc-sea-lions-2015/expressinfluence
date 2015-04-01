get '/comment/new/:id' do
  @contact = Contact.find(params[:id])

  erb :'comment/new'
end

post '/comment/new' do

  redirect "/contact/#{@contact.id}"
end

get '/comment/new/:id' do
  @contact = Contact.find(params[:id])

  erb :'comment/new'
end

post '/comment/new/:id' do
  @comment= Comment.create(content: params[:content], user_id: session[:user_id], contact_id: params[:id])
  @contact = Contact.find(params[:id])


  redirect "/contact/#{@contact.id}"
end

delete '/comment/:id/delete' do

  @comment = Comment.find(params[:id])
  @contact = Contact.find_by(id: @comment.contact_id)

  @comment.destroy

  redirect "/contact/#{@contact.id}"
end

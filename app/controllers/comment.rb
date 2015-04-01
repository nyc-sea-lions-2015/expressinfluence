get '/comment/new/:id' do
  @contact = Contact.find(params[:id])

  if request.xhr?

    erb :'comment/new', :layout => false
  else

    erb :'comment/new'
  end
end

post '/comment/new/:id' do
  @comment= Comment.create(content: params[:content], user_id: session[:user_id], contact_id: params[:id])
  @contact = Contact.find(params[:id])

  if request.xhr?
    erb :"comment/new", :layout => false
  else
    erb :"comment/new"
  end
  redirect "/contact/#{@contact.id}"
end

delete '/comment/:id/delete' do

  @comment = Comment.find(params[:id])
  @contact = Contact.find_by(id: @comment.contact_id)

  @comment.destroy

  redirect "/contact/#{@contact.id}"
end

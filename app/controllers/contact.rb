get '/contact/search' do

  @industry = params[:industry]
  @contacts = Contact.where(industry: @industry)

  erb :'/contact/industry'
end



get '/contact/:id' do
  @contact = Contact.find(params[:id])

  erb :'contact/view'
end

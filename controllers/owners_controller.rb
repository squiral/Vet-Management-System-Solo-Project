require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')
require('pry')

#index

get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

#new

get '/owners/new' do
  @owners = Owner.all()
  erb(:"owners/new")
end

#show

get '/owners/:id' do
  @owner = Owner.find( params[:id] )
  erb(:"owners/show")
end

#create

post '/owners' do
  @owner = Owner.new( params )
  @owner.save
  erb(:"owners/create")
end

#edit

get '/owners/:id/edit' do
  @owner = Owner.find( params[:id] )
  erb(:"owners/edit")
end

#update

post '/owners/:id' do
  @owner = Owner.new( params )
  @owner.update
  erb(:"owners/update")
end


#destroy

post '/owners/:id/delete' do
  @owner = Owner.find( params[:id] )
  @owner.delete()
  erb(:"owners/destroy")
end

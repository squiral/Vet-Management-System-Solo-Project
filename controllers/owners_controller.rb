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

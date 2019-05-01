require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')

#index

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

#new

get '/animals/new' do
  @owners = Owner.all()
  @vets = Vet.all()
  erb(:"animals/new")
end

#show

get '/animals/:id' do
  @animal = Animal.find( params[:id] )
  @owner = @animal.owner
  erb(:"animals/show")
end

#create

post '/animals' do
  @animal = Animal.new( params )
  @animal.save
  erb(:"animals/create")
end

#edit

get '/animals/:id/edit' do
  @animal = Animal.find( params[:id] )
  @vets = Vet.all
  @owners = Owner.all()
  erb(:"animals/edit")
end

#update

post '/animals/:id' do
  @animal = Animal.new( params )
  @animal.update
  erb(:"animals/update")
end

#destroy

post '/animals/:id/delete' do
  @animal = Animal.find( params[:id] )
  @animal.delete()
  erb(:"animals/destroy")
end

require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
require_relative('../models/animal')
also_reload('../models/*')

#index

get '/animals' do
  @animals = Animal.all()
  erb(:"animals/index")
end

#new

get '/animals/new' do
  @vets = Vet.all()
  erb(:"animals/new")
end

#show

get '/animals/:id' do
  @animal = Animal.find( params[:id] )
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
  erb(:"animals/edit")
end

#update

post '/animals/:id' do
  Animal.new( params ).update
  redirect to 'animals'
end

#destroy

post '/animals/:id/delete' do
  animal = Animal.find( params[:id] )
  animal.delete()
  erb(:"animals/destroy")
end

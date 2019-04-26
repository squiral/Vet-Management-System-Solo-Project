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

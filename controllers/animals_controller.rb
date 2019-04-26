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

#show

get '/animals/:id' do
  @animal = Animal.find( params[:id] )
  erb(:"animals/show")
end

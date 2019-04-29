require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
require_relative('../models/animal')
also_reload('../models/*')


#index

get '/vets' do
  @vets = Vet.all()
  erb(:"vets/index")
end

#new

get '/vets/new' do
  @unassigned_animals = Animal.unassigned()
  erb(:"vets/new")
end

#show

get '/vets/:id' do
  @vet = Vet.find( params[:id] )
  erb(:"vets/show")
end

#create

post '/vets' do
  @vet = Vet.new( params )
  @animal = Animal.find( params )
  @animal.vet_id = @vet.id
  @animal.update
  @vet.save
  erb(:"vets/create")
end

#destroy

post '/vets/:id/delete' do
  @vet = Vet.find( params[:id] )
  @vet.delete()
  erb(:"vets/destroy")
end

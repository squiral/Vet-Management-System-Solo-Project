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
  @animals = Animal.all()
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
  @vet.save
  erb(:"vets/create")
end

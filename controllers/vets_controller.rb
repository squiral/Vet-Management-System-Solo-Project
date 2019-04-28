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

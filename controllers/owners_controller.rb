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

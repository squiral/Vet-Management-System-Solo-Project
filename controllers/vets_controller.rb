require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vet')
require_relative('../models/animal')
require_relative('../models/owner')
also_reload('../models/*')
require('pry')


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
  @vet.save


  if params[:chosen_pets] != nil
    for animal_id in params[:chosen_pets]
      animal = Animal.find(animal_id)
      animal.vet_id = @vet.id
      animal.update()
    end
  end

  erb(:"vets/create")
end

#edit

get '/vets/:id/edit' do
  @vet = Vet.find( params[:id] )
  @unassigned_animals = Animal.unassigned()
  erb(:"vets/edit")
end

#update

post '/vets/:id' do
  @vet = Vet.new( params )
  @vet.update()

  if params[:chosen_pets] != nil
    for animal_id in params[:chosen_pets]
      animal = Animal.find(animal_id)
      animal.vet_id = @vet.id
      animal.update()
    end
  end

  erb(:"vets/update")
end

#destroy

post '/vets/:id/delete' do
  @vet = Vet.find( params[:id] )
  @vet.delete()
  erb(:"vets/destroy")
end

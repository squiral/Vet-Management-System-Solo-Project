require_relative( "../models/animal.rb" )
require_relative( "../models/vet.rb" )
require("pry-byebug")

Animal.delete_all()
Vet.delete_all()

vet1 = Vet.new({
  "name" => "Dr.Smith",
})

vet1.save()

animal1 = Animal.new({
  "name" => "Alfie",
  "date_of_birth" => "10/01/12",
  "type" => "dog",
  "vet_id" => vet1.id
  })

  animal1.save()

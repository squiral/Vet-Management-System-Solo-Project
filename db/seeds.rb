require_relative( "../models/animal.rb" )
require_relative( "../models/vet.rb" )
require("pry-byebug")

Animal.delete_all()
Vet.delete_all()

vet1 = Vet.new({
  "name" => "Dr. Smith",
})

vet2 = Vet.new({
  "name" => "Dr. Russell",
})

vet1.save()
vet2.save()

animal1 = Animal.new({
  "name" => "Alfie",
  "date_of_birth" => "10/01/12",
  "type" => "Dog",
  "vet_id" => vet1.id
  })

animal2 = Animal.new({
  "name" => "Mabel",
  "date_of_birth" => "25/10/09",
  "type" => "Cat",
  "vet_id" => vet2.id
  })

animal1.save()
animal2.save()

p animal2.vet

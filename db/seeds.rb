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
  "treatment_notes" => " ",
  "vet_id" => vet1.id
  })

animal2 = Animal.new({
  "name" => "Mabel",
  "date_of_birth" => "25/10/09",
  "type" => "Cat",
  "treatment_notes" => " ",
  "vet_id" => vet2.id
  })

  animal3 = Animal.new({
    "name" => "Calvin",
    "date_of_birth" => "22/04/15",
    "type" => "Snake",
    "treatment_notes" => "Needs constant treats",
    "vet_id" => vet2.id
    })

animal1.save()
animal2.save()
animal3.save()

p vet2.animals()

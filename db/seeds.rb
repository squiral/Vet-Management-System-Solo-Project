require_relative( "../models/animal.rb" )
require_relative( "../models/vet.rb" )
require_relative( "../models/owner.rb" )
require("pry-byebug")

Animal.delete_all()
Owner.delete_all()
Vet.delete_all()

vet1 = Vet.new({
  "name" => "Dr. Smith",
})

vet2 = Vet.new({
  "name" => "Dr. Russell",
})


vet1.save()
vet2.save()

owner1 = Owner.new({
  "first_name" => "Calumn",
  "last_name" => "Fisk",
  "phone_number" => "01620892485",
  "email_address" => "calumn.hotstuff@hotmail.co.uk"
  })



owner2 = Owner.new({
  "first_name" => "Sarah",
  "last_name" => "Miller",
  "phone_number" => "01620892485",
  "email_address" => "s.miller@gmail.com"
  })


owner1.save()
owner2.save()

animal1 = Animal.new({
  "name" => "Alfie",
  "date_of_birth" => "10/01/2012",
  "type" => "Dog",
  "treatment_notes" => " ",
  "vet_id" => vet2.id,
  "owner_id" => owner2.id
  })

animal2 = Animal.new({
  "name" => "Mabel",
  "date_of_birth" => "25/10/2009",
  "type" => "Cat",
  "treatment_notes" => " ",
  "vet_id" => vet2.id,
  "owner_id" => owner2.id
  })

animal3 = Animal.new({
  "name" => "Calvin",
  "date_of_birth" => "22/04/2015",
  "type" => "Snake",
  "treatment_notes" => "Needs constant treats",
  "vet_id" => vet2.id,
  "owner_id" => owner2.id
  })

animal1.save()
animal2.save()
animal3.save()

p vet1.animals.count

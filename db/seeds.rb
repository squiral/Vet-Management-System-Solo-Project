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

vet3 = Vet.new({
  "name" => "Dr. Vevers",
})


vet1.save()
vet2.save()
vet3.save()

owner1 = Owner.new({
  "first_name" => "Calumn",
  "last_name" => "Fisk",
  "phone_number" => "01620 892525",
  "email_address" => "calumn.hotstuff@hotmail.co.uk"
  })



owner2 = Owner.new({
  "first_name" => "Sarah",
  "last_name" => "Miller",
  "phone_number" => "01620 892485",
  "email_address" => "s.miller@gmail.com"
  })


owner3 = Owner.new({
  "first_name" => "Laura",
  "last_name" => "Campbell",
  "phone_number" => "07765723389",
  "email_address" => "campbell.soup@gmail.com"
  })



owner1.save()
owner2.save()
owner3.save()

animal1 = Animal.new({
  "name" => "Alfie",
  "date_of_birth" => "10/01/2013",
  "type" => "Labrador",
  "treatment_notes" => "Recent encounter with tics. Check for signs of Lyme disease. Potentially arthritis - prescribed anti-inflammatory.",
  "vet_id" => vet1.id,
  "owner_id" => owner2.id
  })

animal2 = Animal.new({
  "name" => "Marbles",
  "date_of_birth" => "25/10/2000",
  "type" => "Cat",
  "treatment_notes" => "Severe Hyperthyroidism. Currently prescribed Vidalta, 50mg, daily. Monitor breathing rate.",
  "vet_id" => vet3.id,
  "owner_id" => owner2.id
  })

animal3 = Animal.new({
  "name" => "Calvin",
  "date_of_birth" => "22/04/2015",
  "type" => "Snake",
  "treatment_notes" => "Needs constant treats",
  "vet_id" => vet3.id,
  "owner_id" => owner3.id
  })

animal4 = Animal.new({
  "name" => "Monty",
  "date_of_birth" => "22/04/2015",
  "type" => "Dwarf Hamster",
  "treatment_notes" => "Extremely violent. Approach with caution.",
  "vet_id" => vet2.id,
  "owner_id" => owner1.id
  })

animal1.save()
animal2.save()
animal3.save()
animal4.save()

p vet1.animals.count

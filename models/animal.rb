require_relative( '../db/sql_runner' )
require('date')
require('pry')

class Animal

  attr_reader( :id )
  attr_accessor( :name, :date_of_birth, :type, :treatment_notes, :vet_id, :owner_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @treatment_notes = options['treatment_notes']
    @vet_id = options['vet_id'].to_i if options['vet_id']
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      date_of_birth,
      type,
      treatment_notes,
      vet_id,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @date_of_birth, @type, @treatment_notes, @vet_id, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

  def vet()
    vet = Vet.find(@vet_id)
    return vet
  end

  def owner()
    owner = Owner.find(@owner_id)
    return owner
  end

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      date_of_birth,
      type,
      treatment_notes,
      vet_id,
      owner_id
    ) =
    (
      $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@name, @date_of_birth, @type, @treatment_notes, @vet_id, @owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM animals"
    animal_data = SqlRunner.run(sql)
    animals = map_items(animal_data)
    return animals
  end

  def self.map_items(animal_data)
    return animal_data.map { |animal| Animal.new(animal)  }
  end

  def self.find(id)
    sql = "SELECT * FROM animals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    animal = Animal.new(result)
    return animal
  end

  def self.unassigned()
    sql = "SELECT * FROM animals
    WHERE vet_id IS NULL"
    unassigned_data = SqlRunner.run(sql)
    unassigned_animals = map_items(unassigned_data)
    return unassigned_animals
  end

  def self.find_pets_by_vet(vet_id)
    sql = "SELECT * from animals
    WHERE vet_id = $1"
    values = [@vet_id]
    animal_data = SqlRunner.run(sql, values)
    array_of_animals = map_items(animal_data)
    return array_of_animals
  end


  # convert DoB to age

def convert_date_to_object
  binding.pry
  animal_date_obj = Date.strptime(@date_of_birth,'%m/%d/%Y')
  return animal_date_obj
end

  # def age
  # now = Time.now.utc.to_date
  # now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  # end

  # calculate age from birth years






end

require_relative( '../db/sql_runner' )

class Animal

  attr_reader( :id )
  attr_accessor( :name, :date_of_birth, :type, :treatment_notes, :vet_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @treatment_notes = options['treatment_notes']
    @vet_id = options['vet_id'].to_i if options['vet_id']
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      date_of_birth,
      type,
      treatment_notes,
      vet_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @date_of_birth, @type, @treatment_notes, @vet_id]
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

  def update()
    sql = "UPDATE animals
    SET
    (
      name,
      date_of_birth,
      type,
      treatment_notes,
      vet_id
    ) =
    (
      $1, $2, $3, $4, $5
    )
    WHERE id = $6"
    values = [@name, @date_of_birth, @type, @treatment_notes, @vet_id, @id]
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






end

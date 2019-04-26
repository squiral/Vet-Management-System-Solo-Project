require_relative( '../db/sql_runner' )

class Animal

  attr_reader( :id )
  attr_writer( :name, :date_of_birth, :type, :vet_id )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @date_of_birth = options['date_of_birth']
    @type = options['type']
    @vet_id = options['vet_id'].to_i
  end

  def save()
    sql = "INSERT INTO animals
    (
      name,
      date_of_birth,
      type,
      vet_id
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @date_of_birth, @type, @vet_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end





end

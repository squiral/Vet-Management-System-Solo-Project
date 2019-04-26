require_relative( '../db/sql_runner' )

class Vet

  attr_reader( :id )
  attr_writer( :name )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO vets
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM vets"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "SELECT * FROM vets
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    vet = Vet.new(result)
    return vet
  end







end

require_relative( '../db/sql_runner' )
require('date')
require('pry')

class Owner

  attr_reader( :id )
  attr_accessor( :first_name, :last_name, :phone_number, :email_address )

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @phone_number = options['phone_number']
    @email_address = options['email_address']
  end


  def save()
    sql = "INSERT INTO owners
    (
      first_name,
      last_name,
      phone_number,
      email_address
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @phone_number, @email_address]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE owners
    SET
    (
      first_name,
      last_name,
      phone_number,
      email_address
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @last_name, @phone_number, @email_address, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM owners"
    owner_data = SqlRunner.run(sql)
    owners = map_items(owner_data)
    return owners
  end

  def self.map_items(owner_data)
    return owner_data.map { |owner| Owner.new(owner)  }
  end

  def self.find(id)
    sql = "SELECT * FROM owners
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    owner = Owner.new(result)
    return owner
  end

  def format_name
    full_name = @first_name.capitalize + " " + @last_name.capitalize
    return full_name
  end








end

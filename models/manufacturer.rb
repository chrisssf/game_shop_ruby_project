require_relative('../db/sql_runner')


class Manufacturer

attr_reader :id
attr_accessor :name, :country, :description, :deactivated

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"].downcase
    @country = options["country"]
    @description = options["description"]
    @deactivated = options["deactivated"]
  end

  def save()
    sql = "INSERT INTO manufacturers
    (
      name,
      country,
      description,
      deactivated
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@name, @country, @description, @deactivated]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.delete_all()
    sql = "DELETE FROM manufacturers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM manufacturers"
    results = SqlRunner.run(sql)
    return results.map { |manufacturer| Manufacturer.new(manufacturer) }
  end

  def delete()
    sql = "DELETE FROM manufacturers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE manufacturers
    SET
    (
      name,
      country,
      description,
      deactivated
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values =[@name, @country, @description, @deactivated, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM manufacturers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    manufacturer = Manufacturer.new(result)
    return manufacturer
  end

  def self.search_manufacturers(search_term, deactivated)
    search = ('%' + search_term + '%').downcase
    sql = "SELECT * FROM manufacturers
    WHERE name LIKE $1 AND deactivated = $2"
    values = [search, deactivated]
    results = SqlRunner.run(sql, values)
    return results.map { |manufacturer| Manufacturer.new(manufacturer) }
  end


end

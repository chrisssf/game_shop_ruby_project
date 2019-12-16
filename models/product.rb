require_relative('../db/sql_runner')
require_relative('./manufacturer')

class Product

  attr_reader :id
  attr_accessor :name, :description, :stock_quantity, :buying_cost, :selling_price, :genre, :type, :manufacturers_id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i
    @buying_cost = options["buying_cost"].to_f
    @selling_price = options["selling_price"].to_f
    @genre = options["genre"]
    @type = options["type"]
    @manufacturers_id = options["manufacturers_id"].to_i
  end

  def save()
    sql = "INSERT INTO products
    (
      name,
      description,
      stock_quantity,
      buying_cost,
      selling_price,
      genre,
      type,
      manufacturers_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    RETURNING id"
    values = [@name, @description, @stock_quantity, @buying_cost, @selling_price, @genre, @type, @manufacturers_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.delete_all()
    sql = "DELETE FROM products"
    SqlRunner.run( sql )
  end

  def self.all()
    sql = "SELECT * FROM products"
    results = SqlRunner.run(sql)
    return results.map { |product| Product.new(product) }
  end

  def delete()
    sql = "DELETE FROM products
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def update()
    sql = "UPDATE products
    SET
    (
      name,
      description,
      stock_quantity,
      buying_cost,
      selling_price,
      genre,
      type,
      manufacturers_id
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7, $8
    )
    WHERE id = $9"
    values = [@name, @description, @stock_quantity, @buying_cost, @selling_price, @genre, @type, @manufacturers_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM products
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    product = Product.new(result)
    return product
  end

  def manufacturers_name()
    manufacturer = Manufacturer.find(@manufacturers_id)
    manufacturer_name = manufacturer.name
    return manufacturer_name
  end

  def stock_status()
    if @stock_quantity == 0
      return " - Out of Stock!"
    elsif @stock_quantity <= 5
      return " - Low Stock!"
    end
  end

end

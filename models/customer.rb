require_relative('../db/sql_runner')

class Customer

  attr_accessor :id, :name, :funds

  def initialize(db_hash) #options is a hash data type. When we query sql it always gives back an array of hashes.
  @id = db_hash['id'].to_i if db_hash['id'] #will be a string as a database always return strings. So convert to integer.
  @name = db_hash['name']
  @funds = db_hash['funds'].to_f # converted to a float as it will have decimal places.
  end



  def save() #CREATE
  sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING *" # put into the table called customers,
  values = [@name, @funds] # in the columns called name and funds, the values.
  customer = SqlRunner.run(sql ,values)
  @id = customer.first['id'].to_i
  end

  def self.all() #READ
  sql = "SELECT * FROM customers"
  customer_data = SqlRunner.run(sql) # customer date will be an array of hashes.
  customers = customer_data.map{|geezer|Customer.new(geezer)} # now we have an array of customer instances.
  return customers                                            # .map returns all the customers detail, name, id etc compiled under a instance name.
  end

  def update() #UPDATE
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3" # telling it what the columns are called I want to update.
  values =[@name, @funds, @id]
  SqlRunner.run(sql, values)
  end

  def delete() #DELETE
  sql = "DELETE FROM customers WHERE id = $1"
  values = [@id]
  result = SqlRunner.run(sql, values)
end

def films_customer_booked() #WHICH FILMS A CUSTOMER HAS BOOKED TO SEE.
  sql = "SELECT films.* FROM films
  INNER JOIN tickets
  ON films.id = tickets.film_id
  WHERE tickets.customer_id = $1"
  values = [@id]
  films_data = SqlRunner.run(sql, values)
  result = films_data.map{|film|Film.new(film)}
  return result
end

# def customer_funds_decrease() #CUSTOMER FUNDS DECREASE AFTER BUYING TICKETS. put customers back in.
# sql = "SELECT tickets.* FROM customers
# INNER JOIN tickets ON customers.id = tickets.customer_id
# WHERE tickets.customer_id = $1"
# values = [@id]
# result = SqlRunner.run(sql, values)
# result.each{|price|@funds -= price['price'].to_f}
# return @funds
# end




end

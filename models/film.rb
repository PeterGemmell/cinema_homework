require_relative('../db/sql_runner')

class Film

  attr_accessor :id, :title, :price


  def initialize(db_hash)
  @id = db_hash['id'].to_i if db_hash['id'] #if this id key exists, it will be true.
  @title = db_hash['title']
  @price = db_hash['price'].to_f
   end

   def save() #CREATE
   sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING *"
   values = [@title, @price]
   film = SqlRunner.run(sql, values)
   @id = film.first['id'].to_i
   end

   def Film.all() #READ
   sql = "SELECT * FROM films"
   film_data = SqlRunner.run(sql)
   films = film_data.map{|movie|Film.new(movie)}
   return films
 end

 def update() #UPDATE
 sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
 values = [@title, @price, @id]
 SqlRunner.run(sql, values)
 end

 def delete() #DELETE
 sql = "DELETE FROM films WHERE id = $1"
 values = [@id]
 result = SqlRunner.run(sql, values)
end

def customer_coming_to_see_film() #WHICH CUSTOMERS ARE COMING TO SEE ONE FILM.
sql = "SELECT customers.* FROM customers
INNER JOIN tickets
ON customers.id = tickets.customer_id
WHERE tickets.film_id = $1"
values = [@id]
customers_data = SqlRunner.run(sql, values)
result = customers_data.map{|customer|Customer.new(customer)}
return result
end





end

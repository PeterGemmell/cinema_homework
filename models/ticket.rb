require_relative('../db/sql_runner')

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize(db_hash)
  @id = db_hash['id'].to_i if db_hash['id'] #if this id key exists, it will be true.
  @customer_id = db_hash['customer_id'].to_i
  @film_id = db_hash['film_id'].to_i
  end


  def save() #CREATE
  sql = "INSERT INTO tickets (customer_id, film_id)
  VALUES ($1, $2) RETURNING id"
  values = [@customer_id, @film_id]
  result = SqlRunner.run(sql, values)
  @id = result.first['id'].to_i
end

def Ticket.all() #READ
  sql = "SELECT * FROM tickets"
  ticket_data = SqlRunner.run(sql)
  tickets = ticket_data.map{|ticket|Ticket.new(ticket)}
  return tickets
end

def update() #UPDATE
  sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3"
  values = [@customer_id, @film_id, @id]
  SqlRunner.run(sql, values)
end

def delete() #DELETE
sql = "DELETE FROM tickets WHERE id = $1"
values = [@id]
result = SqlRunner.run(sql, values)
end

end

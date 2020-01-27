require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')




customer1 = Customer.new({'name' => 'peter', 'funds' => 10.50})
customer1.save()

customer2 = Customer.new({'name' => 'adla', 'funds' => 10.50})
customer2.save()

customer3 = Customer.new({'name' => 'john', 'funds' => 20.00})
customer3.save()

customer4 = Customer.new({'name' => 'robbie', 'funds' => 15.00})
customer4.save()


customer1.funds = 100.30
customer1.update()

# customer1.delete()



film1 = Film.new({'title' => 'Once Upon a Time in Hollywood', 'price' => 12.00})
film1.save()

film2 = Film.new({'title' => 'Bad Boys For Life', 'price' => 11.00})
film2.save()

film3 = Film.new({'title' => 'The Gentlemen', 'price' => 11.00})
film3.save()

film4 = Film.new({'title' => 'Just Mercy', 'price' => 12.00})
film4.save()

film1.price = 15.00
film1.update()

film2.price = 15.00
film2.update()


# film2.delete()



ticket1 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket1.save()

ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2.save()

ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket3.save()

ticket4 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id})
ticket4.save()

ticket5 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
ticket5.save()

ticket1.customer_id = customer2.id
ticket1.update()

# ticket1.delete()





binding.pry
nil

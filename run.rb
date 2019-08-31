require './lib/customer.rb'
require './lib/meal.rb'
require './lib/waiter.rb'
require 'pry'
sam = Customer.new("Sam", 27)
  pat = Waiter.new("Pat", 2)
  alex = Waiter.new("Alex", 5)
 
  sam.new_meal(pat, 50, 10) # A Customer creates a Meal, passing in a Waiter instance
  sam.new_meal(alex, 20, 3) # A Customer creates a Meal, passing in a Waiter instance
  pat.new_meal(sam, 30, 5) 

binding.pry

true
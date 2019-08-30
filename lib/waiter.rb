class Waiter
  attr_accessor :years_of_experience  
  attr_reader :name

  @@all = []

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    max_tip = meals.collect {|meal| meal.tip}.max
    meals.find {|meal| meal.tip == max_tip}.customer   
  end    
end
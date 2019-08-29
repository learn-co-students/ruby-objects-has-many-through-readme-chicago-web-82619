class Waiter
  @@all = []

  def initialize(name, exp)
    @name = name
    @exp = exp
    @@all << self
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    Meal.all.inject {|memo, meal| memo.tip < meal.tip ? meal : memo}.customer
  end

  def customers
    meals.map {|meal| meal.customer}
  end

  def self.all
    @@all
  end
end

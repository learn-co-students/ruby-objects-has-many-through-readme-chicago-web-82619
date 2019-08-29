class Waiter

    attr_reader :name, :exp
    @@all = []

    def initialize(name, exp)
        @name = name
        @exp = exp
        @@all << self
    end

    def self.all
        @@all
    end 

    def new_meal(customer, total, tip)
        meal = Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        tips = meals.map {|meal| [meal.tip,meal.customer.name]}
        tips = tips.sort
        best_customer = tips.last[-1]
        Customer.all.find {|customer| customer.name == best_customer}
    end

end
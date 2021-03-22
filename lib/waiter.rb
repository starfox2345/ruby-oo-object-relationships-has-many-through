class Waiter

    attr_accessor :name, :exp
    

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
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meals| meals.waiter == self}
    end

    def best_tipper
        tip = 0 
        Meal.all.each do |meals|
            if meals.tip > tip
                tip = meals.tip
            end
        end
        Meal.all.find {|meals| meals.tip == tip}.customer


    end
end

class Person
	attr_accessor :age, :name

	def hey
		"\tI'm a human named #{name}, I'm #{age} years old" 
	end

end

class MissAmerica < Person
    attr_accessor :state, :talent, :dress_color
    
    def greeting
        "Hi, my name is #{@name}, I'm #{age} years old from #{state}!"
    end
    
    def save_the_world
        "I'm going to save the world by #{talent}!"
    end
    
    def donald_trump
        "Donald Trump loves #{name}'s #{dress_color} dress."
    end
 
end

Betty = MissAmerica.new() 

Betty.age = 22
Betty.name = "Betty"
Betty.state = "Alabama"
Betty.talent = "backflipping"
Betty.dress_color = "green"

puts Betty.greeting
puts Betty.save_the_world
puts Betty.donald_trump



Bobby = Person.new()
Bobby.name = "Bobby"
Bobby.age = 78

puts Bobby.hey


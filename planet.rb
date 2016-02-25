#HW - TUES - FEB 23 2016
#Last edited: FEB 23 9:59PM PST
# gives information about planets (with ability to add new planet info)
# planets are created in Planet class which is called in SolarSystem class

# Planet class initializes a hash for adding info to a planet
class Planet
  attr_accessor :name, :diameter, :rings, :rotation_period, :circles_sun, :moons

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter] #kilometers or miles
    @rings = planet_hash[:rings]
    @rotation_period = planet_hash[:rotation_period]
    @circles_sun = planet_hash[:circles_sun]
    @moons = planet_hash[:moons]
  end
end
#check user input.. this doesn't work. Please re-enter. etc

#SolarSystem class initializes the universe.
#Calls Planets into existance
class SolarSystem
  attr_accessor :planets
  def initialize(planets)
    @planets = planets
  end

  #method for user to add a NEW planet! asks for input info for each hash
  #no ducks given about what the user inputs.. doesnt check for int
  #also I feel like the print/ gets could be put into a separate simpler method
  def adds new_planet
    u_name = new_planet.downcase.capitalize

    print "What is the new planet diameter in kilometers?: "
    u_diam = gets.chomp.upcase

    print "How many rings does the planet have?: "
    u_rings = gets.chomp

    print "How long does your planet take to rotate in hours?: "
    u_rotate = gets.chomp

    print "How long does the planet take to circle the sun in years?: "
    u_sun = gets.chomp

    print "How many moons does the new planet have?: "
    u_moon = gets.chomp

    new_planet = Planet.new(name: "#{u_name}", diameter: "#{u_diam}",
    rings: "#{u_rings}", rotation_period: "#{u_rotate} HRS",
    circles_sun: "#{u_sun} YRS", moons: "#{u_moon}")

    @planets.insert(-1, new_planet) #inserts planet to the end of the array
  end
end

# random info about planetsssss wheeeeee
mercury = Planet.new(name: "Mercury", diameter: "4850 KM", rings: "0",
rotation_period: "1409 HRS", circles_sun: "0.24 YRS", moons: "0")
venus = Planet.new(name: "Venus", diameter: "12000 KM", rings: "0",
rotation_period: "5832 HRS", circles_sun: "0.62 YRS", moons: "0")
earth = Planet.new(name: "Earth", diameter: "12000 KM", rings: "0",
rotation_period: "24 HRS", circles_sun: "1 YRS", moons: "1")
mars = Planet.new(name: "Mars", diameter: "6790 KM", rings: "0",
rotation_period: "24.6 HRS", circles_sun: "1.882 YRS", moons: "2")
jupiter = Planet.new(name: "Jupiter", diameter: "142980 KM", rings: "4",
rotation_period: "10 HRS", circles_sun: "12 YRS", moons: "67")
saturn = Planet.new(name: "Saturn", diameter: "120536 KM", rings: "3",
rotation_period: "10 HRS", circles_sun: "29.5 YRS", moons: "62")
uranus = Planet.new(name: "Uranus", diameter: "51118 KM", rings: "13",
rotation_period: "18 HRS", circles_sun: "84 YRS", moons: "27")
neptune = Planet.new(name: "Neptune", diameter: "49500 KM", rings: "5",
rotation_period: "19 HRS", circles_sun: "165 YRS", moons: "13")
pluto = Planet.new(name: "Pluto", diameter: "2360 KM", rings: "0",
rotation_period: "154 HRS", circles_sun: "248 YRS", moons: "4")

#creates an array with the info ^ and then with the string of that info
planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]
planets2 = ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", +
  "neptune", "pluto"]

# START OF THE UNIVERSEEEEEEEE
big_bang = SolarSystem.new(planets)

#intro and asks user if they wanna create a new planet
print "Hello. Welcome to the planet information program.\n"
print "Would you like to create a new planet? (YES/NO): "
user2 = gets.chomp.downcase

#creates a loop to keep adding planets
until user2 == "no"
  if user2 == "yes"
    print "\nWhat is the name of your planet?: "
    new_planet = gets.chomp.downcase

    # prevents already existing planets from recreation
    unless planets2.include? new_planet
    big_bang.adds new_planet
    planets2.insert(-1, big_bang.planets[-1].name.to_s.downcase)
    else
      puts "#{new_planet.capitalize} is already a part of this solar system. "+
      "Try a new name."
    end
  end
  print "\nWould you like to create a new planet? (YES/NO): "
  user2 = gets.chomp.downcase
end

#info sesh
print "\nPlease name a planet you wish to learn about: "
user = gets.chomp.downcase
puts

#loop to display info of the planet received by user until QUIT
until user == "quit"
  if planets2.include? user
    indy = planets2.index(user) #finds index of planet in planet2 array
    orb = big_bang.planets[indy] #places planet hash into a shorter var
    puts "#{orb.name} has a diameter of #{orb.diameter}."
    puts "#{orb.name} has #{orb.rings} ring(s)."
    puts "#{orb.name} takes #{orb.rotation_period} to rotate on its axis."
    puts "#{orb.name} takes #{orb.circles_sun} to rotate around the sun."
    puts "#{orb.name} has #{orb.moons} moons!\n\n"
  else
    puts "\nPlease enter an acceptable planet: #{planets2}. " +
    "OR type QUIT to leave.\n\n"  #lists the acceptable planets
  end

  print "Enter a planet for more information: "
  user = gets.chomp.downcase
end

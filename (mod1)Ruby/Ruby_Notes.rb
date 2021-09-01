Ruby_Notes :: 3-17-21

# everything except nil and false is considered TRUE


		NAME BEGINS WITH	VARIABLE SCOPE
			$				A global variable
			@				An instance variable
			[a-z] or _		A local variable
			[A-Z]			A constant
			@@				A class variable

## ********************************************************************
## Basics
## ********************************************************************
		- `$ irb`: to write ruby in the terminal
		- dont use '' in ruby, use "" instead
		- "".size > 0 ? "Non-empty string" : "Empty string"
		- Addition (+)
		- Subtraction (-)
		- Multiplication (\*)
		- Division (/)
		- Exponentiation (\*\*)
		- Modulo (%)
		- The concatenation operator (<<)
		- you can do 1 += 1 –– which gives you 2 but 1++ and 1-- does not exist in ruby
		- you can replace most `{}` with `do end` and vice versa –– not true for hashes or `#{}` escapings
		- Best Practice: end names that produce booleans with question mark
		- CRUD: create, read, update, delete
		- `[1,2].map(&:to_i)`
		- `integer`: number without decimal
		- `float`: number with decimal
		- tag your variables:
		- - `$`: global variable
		- - `@`: instance variable
		- - `@@`: class variable
		- `1_000_000`: 1000000 –– just easier to read\*

		$x = 10 # => 10
		defined? $x # => "global-variable"

## ********************************************************************
## Vars, Contants, Arrays, Hashes & Symbols
## ********************************************************************
	my_variable ||= "Hi" # ||= is a conditional assignment only set the variable if it was not set before.

		### Constants -------------------------------------------------
			MY_CONSTANT = # something

		### Arrays -------------------------------------------------
			my_array = [a,b,c,d,e]
			my_array[1] # b
			my_array[2..-1] # c , d , e
			multi_d = [[0,1],[0,1]]
			[1, 2, 3] << 4 # [1, 2, 3, 4] same as [1, 2, 3].push(4)

		### Hashes -------------------------------------------------
			hash = { "key1" => "value1", "key2" => "value2" } # same as objects in JavaScript
			hash = { key1: "value1", key2: "value2" } # the same hash using symbols instead of strings
			my_hash = Hash.new # same as my_hash = {} – set a new key like so: pets["Stevie"] = "cat"
			pets["key1"] # value1
			pets["Stevie"] # cat
			my_hash = Hash.new("default value")
			hash.select{ |key, value| value > 3 } # selects all keys in hash that have a value greater than 3
			hash.each_key { |k| print k, " " } # ==> key1 key2
			hash.each_value { |v| print v } # ==> value1value2

			my_hash.each_value { |v| print v, " " }
			# ==> 1 2 3

		### Symbols -------------------------------------------------
			:symbol # symbol is like an ID in html. :Symbols != "Symbols"
			# Symbols are often used as Hash keys or referencing method names.
			# They can not be changed once created. They save memory (only one copy at a given time). Faster.
			:test.to_s # converts to "test"
			"test".to_sym # converts to :test
			"test".intern # :test
			# Symbols can be used like this as well:
			my_hash = { key: "value", key2: "value" } # is equal to { :key => "value", :key2 => "value" }

## ********************************************************************
## ********************************************************************
		"Model.new (instantiation)"						Model.new
		"Model.new (setting attributes)"				Model.new(attrs)
		"Model.first"									Model.first.look
		"Model.take"									Model.take
		"Model.all limit(100)"							Model.look Model.limit(100)
		"Model.all take(100)"							Model.look Model.take(100)
		"Model.all limit(100) with relationship"		Model.feel Model.limit(100).includes(:user)

		"Model.named_scope"								Model.limit(10).with_name.with_notes

		"Model.transaction"								Model.transaction { Model.new }
		"Model.find(id)"								Model.find(1)
		"Model.find_by_sql"								Model.find_by_sql("SELECT * FROM exhibits WHERE id = #{(rand * 1000 + 1).to_i}").first
		"Model.log"										Model.connection.send(:log, "hello", "world") { }
		"AR.execute(query)"								ActiveRecord::Base.connection.execute("SELECT * FROM exhibits WHERE id = #{(rand * 1000 + 1).to_i}")

## ********************************************************************
## Usefull Methods
## ********************************************************************

		1.is_a? Integer # returns true
		:1.is_a? Symbol # returns true
		"1".is_a? String # returns true
		[1,2,3].collect!() # does something to every element (overwrites original with ! mark)
		.map() # is the same as .collect
		1.2.floor # 1 # rounds a float (a number with a decimal) down to the nearest integer.
		cube.call # implying that cube is a proc, call calls procs directly
		Time.now # displays the actual time
## ********************************************************************
## Calculation
## ********************************************************************
		- Addition (+)
		- Subtraction (-)
		- Multiplication (\*)
		- Division (/)
		- Exponentiation (\*\*)
		- Modulo (%)
		- The concatenation operator (<<)
		- you can do 1 += 1 –– which gives you 2 but 1++ and 1-- does not exist in ruby
		- `"A " << "B"` => `"A B"` but `"A " + "B"` would work as well but `"A " + 4 + " B"` not. So rather use string interpolation (`#{4}`)
		- `"A #{4} B"` => `"A 4 B"`



## ********************************************************************
## Conditions
## ********************************************************************
		- `&&`: and
		- `||`: or
		- `!`: not
		- `(x && (y || w)) && z`: use parenthesis to combine arguments
		- problem = false
		- print "Good to go!" unless problem –– prints out because problem != true

		### IF -------------------------------------------------
			if 1 < 2
			puts “one smaller than two”
			elsif 1 > 2 # *careful not to mistake with else if. In ruby you write elsif*
			puts “elsif”
			else
			puts “false”
			end
			# or
			puts "be printed" if true
			puts 3 > 4 ? "if true" : "else" # else will be putted


		### unless -------------------------------------------------
			unless false # unless checks if the statement is false (opposite to if).
			puts “I’m here”
			else
			puts “not here”
			end
			# or
			puts "not printed" unless true


		### case -------------------------------------------------
			case my_var
			  when "some value"
			    ###
			  when "some other value"
			    ###
			  else
			    ###
			end
			# or
			case my_var
			  when "some value" then ###
			  when "some other value" then ###
			  else ###
			end
## ********************************************************************
## Printing & Putting
## ********************************************************************
		print "bla"
		puts "test" 	# puts the text in a separate line

## ********************************************************************
## String Methods
## ********************************************************************
		"Hello".length 				# 5
		"Hello".reverse 			# “olleH”
		"Hello".upcase 				# “HELLO”
		"Hello".downcase 			# “hello”
		"hello".capitalize 			# “Hello”
		"bla,bla".split(“,”) 		# takes sting and returns an array (here  ["bla","bla"])
		"Hello".include? "i" 		# equals to false because there is no i in Hello
		"Hello".gsub!(/e/, "o") 	# Hollo
		"1".to_i 					# transform string to integer –– 1
		"test".to_sym 				# converts to :test
		"test".intern 				# :test
		:test.to_s 					# converts to "test"

## ********************************************************************
## User Input
## ********************************************************************
		gets # is the Ruby equivalent to prompt in javascript (method that gets input from the user)
		gets.chomp # removes extra line created after gets (usually used like this)
## ********************************************************************
## ARRAYS
## ********************************************************************
	sharks = ["Tiger", "Great White", "Hammerhead", "Angel"]
	numbers = [2,4,6,8]

	# Retrieving Multiple -------------------------------------------------
			sharks[1,2] 			# ["Great White", "Hammerhead"]
			sharks.slice(1,2)   	# ["Great White", "Hammerhead"]
			sharks.take(2)  		# ["Tiger", "Great White"]
			sharks.sample(2) 		# ["Whale", "Great White"]

	# Finding and Filtering Elements -------------------------------------------------
			sharks.include? "Tiger"      				# true
			Model.find(id, id*)
			Model.find([id, id])
			sharks.find {|item| item.include?("a")}
			Model.find_by(key: value)
			sharks.select {|item| item.include?("a")}
			sharks.reject {|item| item.include?("a")}
			sharks.reverse
			Entry.where("user_id = ?", params[:users])	# single argument
			Entry.where("user_id = ? AND completed = ?", params[:users], true)	# multiple arguments
			Entry.where(user_id: 1)
			Entry.where(user_id: 1, completed: true)
			Entry.where(user_id: 1).find_by(completed: false)

	# Sorting -------------------------------------------------
			"a" <=> "b" 								# = 1 – combined comparison operator. Returns 0 if first = second, 1 if first > second, -1 if first < second
			array.sort!									# ! to mutate original array
			sharks.sort{|a,b| a <=> b } 				# ASC sort
			sharks.sort{|a, b| a[:name] <=> b[:name]} 	# ASC sort arrays of hashes
			sharks.sort{|a,b| b <=> a } 				#=> DSC sort ["Tiger", "Hammerhead", "Great White", "Angel"]
			array = [5,4,1,3,2]
	
	# Removing Duplicate Elements -------------------------------------------------
			sharks = ["Tiger", "Great White"], new_sharks = ["Tiger", "Hammerhead"]

			sharks + new_sharks			#=> ["Tiger", "Great White", "Tiger", "Hammerhead"] ## Does not remove duplicates
			sharks | new_sharks 		#=> ["Tiger", "Great White", "Hammerhead"] ## Pipe Operator which merges the arrays together + removes duplicates
			sharks - new_sharks   		#=> ["Great White"] ## subtraction, which means you could subtract new_sharks from sharks to get only the new values

			[1,2,3,4,1,5,3].uniq   		#=> [1,2,3,4,5]
	
	# Transforming Data -------------------------------------------------
			numbers.map {|number| number * number}
			sharks.map {|shark| "<option>#{shark}</option>"}		#=> ["<option>Hammerhead</option>", "<option>Great White</option>", "<option>Tiger</option>", "<option>Whale</option>"]
			sharks.join(" ") 										#=> Tiger Great White Hammerhead Angel

	# REDUCE -------------------------------------------------
			[1, 2, 3].reduce(:+)	#=> 6	## reduce method lets you specify a binary method by passing its name as a symbol. That means you can pass :+ to the reduce method to sum the array:
			
			[1,2,3].reduce(3) {|result, current| result += current } 		#=> 9  ### 3 is set as initial value

			["1", "2", "a", "3"].reduce([]) do |array, current|
  				val = Integer(current) rescue nil
			  	array.push(val) unless val.nil?
			  	array
			end
			print integers #=> [1,2,3]

	# ARRAYS METHODS EXECUTION SPEED COMPARISON 	-------------------------------------------------
			1) Clients.all.map(&:email)		# Fetched all the data and then Ruby had to process it
			2) Client.pluck(:email)			# (Faster) b/c we told the database to fetch only the email column/attribute. 
			
			1) Order.sum(:total)			# (pass symbol) (Faster) b/c we transferred the responsibility of calculating the sum of orders onto the database
			2) Order.sum(&:total)			# (pass block)

			1) Order.pluck(:email).uniq		# Rails fetches all email addresses, creates an array from them, and then calls the Array#uniq method on it. 
			2) Order.uniq.pluck(:email)		# (Faster) database is responsible for filtering unique values (by using the DISTINCT directive)

			1) Order.where(state: 'cart').where('updated_at < ?', 7.days.ago).each do |order| order.update(inactive: true) end
			2) Order.where(state: 'cart').where('updated_at < ?', 7.days.ago).update_all(inactive: true)

## ********************************************************************
## Loops
## ********************************************************************
		# While loop: -------------------------------------------------
			i = 1
			while i < 11
			  puts i
			  i = i + 1
			end

		# Until loop: -------------------------------------------------
			i = 0
			until i == 6
			  puts i
			  i += 1
			end

		# For loop -------------------------------------------------
			for i in 1...10 # ... tells ruby to exclude the last number (here 10 if we .. only then it includes the last num)
			  puts i
			end

		# Loop iterator -------------------------------------------------
			i = 0
			loop do
			  i += 1
			  print "I'm currently number #{i}" # a way to have ruby code in a string
			  break if i > 5
			end

		# Next -------------------------------------------------
			for i in 1..5
			  next if i % 2 == 0 # If the remainder of i / 2 is zero, we go to the next iteration of the loop.
			  print i
			end


		# .each -------------------------------------------------
			things.each { |item| print "#{item}" }				# for each things in things do something while storing that things in the variable item

		# .each on hashes like so:  -------------------------------------------------
			hashes.each do |x,y|
			  print "#{x}: #{y}"
			end

		# .times -------------------------------------------------
			10.times {
			  print “this text will appear 10 times”
			}

		# .upto / .downto -------------------------------------------------
			10.upto(15) { |x| print x, " " } # 10 11 12 13 14 15
			"a".upto("c") { |x| print x, " " } # a b c






## ********************************************************************
## Methods
## ********************************************************************

		def greeting(hello, *names) ### *name is a splat argument, takes several parameters passed in an array
		  return "#{hello}, #{names}"
		end

		start = greeting("Hi", "Justin", "Maria", "Herbert") # call a method by name

		def name(variable=default)
		  ### The last line in here get's returned by default
		end

## ********************************************************************
## Classes
## ********************************************************************
		#custom objects_
			class Person # class names are rather written in PascalCase (It is similar to camelcase, but the first letter is capitalized)
			  @@count = 0
			  attr_reader :name # make it readable
			  attr_writer :name # make it writable
			  attr_accessor :name # makes it readable and writable

			  def Methodname(parameter)
			    @classVariable = parameter
			    @@count += 1
			  end

			  def self.show_classVariable
			    @classVariable
			  end

			  def Person.get_counts # is a class method
			    return @@count
			  end

			  private

			  def private_method; end # Private methods go here
			end

			matz = Person.new("Yukihiro")
			matz.show_name # Yukihiro


		### inheritance
			class DerivedClass < BaseClass; end # if you want to end a Ruby statement without going to a new line, you can just type a semicolon.

			class DerivedClass < Base
			  def some_method
			    super(optional args) # When you call super from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.
			      # Some stuff
			    end
			  end
			end

			# Any given Ruby class can have only one superclass. Use mixins if you want to incorporate data or behavior from several classes into a single class.

## ********************************************************************
## Modules
## ********************************************************************
		module ModuleName # module names are rather written in PascalCase
		  # variables in modules doesn't make much sence since modules do not change. Use constants.
		end

		Math::PI # using PI constant from Math module. Double colon = scope resolution operator = tells Ruby where you're looking for a specific bit of code.

		require 'date' # to use external modules.
		puts Date.today # 2016-03-18

		module Action
		  def jump
		    @distance = rand(4) + 2
		    puts "I jumped forward #{@distance} feet!"
		  end
		end

		class Rabbit
		  include Action # Any class that includes a certain module can use those module's methods! This now is called a Mixin.
		  extend Action # extend keyword mixes a module's methods at the class level. This means that class itself can use the methods, as opposed to instances of the class.
		  attr_reader :name
		  def initialize(name)
		    @name = name
		  end
		end

		peter = Rabbit.new("Peter")
		peter.jump # include
		Rabbit.jump # extend

## ********************************************************************
## Blocks & Procs
## ********************************************************************
		### Code Blocks are not objects_ A block is just a bit of code between do..end or {}. Its not an object on its own, but it can be passed to methods like .each or .select.
			def yield_name(name)
			  yield("Kim") # print "My name is Kim. "
			  yield(name) # print "My name is Eric. "
			end

			yield_name("Eric") { |n| print "My name is #{n}. " } # My name is Kim. My name is Eric.
			yield_name("Peter") { |n| print "My name is #{n}. " } # My name is Kim. My name is Eric. My name is Kim. My name is Peter.

		### Proc // _saves blocks and are objects_ A proc is a saved block we can use over and over.

			cube = Proc.new { |x| x ** 3 }
			[1, 2, 3].collect!(&cube) # [1, 8, 27] # the & is needed to transform the Proc to a block.
			cube.call # call procs directly

## ********************************************************************
## Lambdas
## ********************************************************************
		lambda { |param| block }
		multiply = lambda { |x| x * 3 }
		y = [1, 2].collect(&multiply) # 3 , 6

		Diff between blocs and lambdas:

		- a lambda checks the number of arguments passed to it, while a proc does not (This means that a lambda will throw an error if you pass it the wrong number of arguments, whereas a proc will ignore unexpected arguments and assign nil to any that are missing.)
		- when a lambda returns, it passes control back to the calling method; when a proc returns, it does so immediately, without going back to the calling method.
		  So: A lambda is just like a proc, only it cares about the number of arguments it gets and it returns to its calling method rather than returning immediately.
## ********************************************************************
## Comment
## ********************************************************************
		=begin
		Bla
		Multyline comment
		=end

		# single line comment



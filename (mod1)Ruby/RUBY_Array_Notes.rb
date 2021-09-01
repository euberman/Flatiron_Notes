# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#      ARRAY
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# ADD ARRAYS TOGETHER

				[1, 2] + [2, 3, 4] # => [1, 2, 2, 3, 4]
				[1, 2] | [2, 3, 4] # => [1, 2, 3, 4]
				my_array = [1, 2]
				my_array += [2, 3, 4] # => [1, 2, 2, 3, 4]

			# _______________________________________________________________________________________________
			# Accessing ARRAY Elements

				arr = [1, 2, 3, 4, 5, 6]
				arr[2]    #=> 3
				arr[100]  #=> nil
				arr[-3]   #=> 4
				arr[2, 3] #=> [3, 4, 5]
				arr[1..4] #=> [2, 3, 4, 5]
				arr[1..-3] #=> [2, 3, 4]
				arr.first #=> 1
				arr.last  #=> 6
				arr.take(3) #=> [1, 2, 3]	return the first n elements of an array, use take
				arr.drop(3) #=> [4, 5, 6]	drop does the opposite of take, by returning the elements after n elements have been dropped
				a.drop_while {|i| i < 3 }   #=> [4, 5, 6]
			# _______________________________________________________________________________________________
			# OBTAINING INFO FROM ARRAY
				arr = ["a", "b", "c"]
				arr.empty? #=> false					check whether an array contains any elements at all
				arr.include?('c') #=> true	check whether a particular item is included in the array
				arr.any?('c')
				arr.all?

				a.index("b")              #=> 1
				a.index("z")              #=> nil
				a.index {|x| x == "b"}    #=> 1

				ary = [1, 2, 4, 2]
				ary.count                  #=> 4
				ary.count(2)               #=> 2
				ary.count {|x| x%2 == 0}   #=> 3
			# _______________________________________________________________________________________________
			# ADD
				arr = [1, 2, 3, 4]
				arr.push(5) #=> [1, 2, 3, 4, 5]
				arr << 6    #=> [1, 2, 3, 4, 5, 6]
				arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]
				arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]
				arr.insert(3, 'orange', 'pear', 'grapefruit') #=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

				[ "a", "b" ].concat( ["c", "d"])   #=> [ "a", "b", "c", "d" ]
				[ "a" ].concat( ["b"], ["c", "d"]) #=> [ "a", "b", "c", "d" ]
				[ "a" ].concat #=> [ "a" ]
				a = [ 1, 2, 3 ]
				a.concat( [ 4, 5 ])
				a                                 #=> [ 1, 2, 3, 4, 5 ]
				a = [ 1, 2 ]
				a.concat(a, a)                    #=> [1, 2, 1, 2, 1, 2]

				[ "a", "b", "c" ].join        #=> "abc"
				[ "a", "b", "c" ].join("-")   #=> "a-b-c"
				[ "a", [1, 2, [:x, :y]], "b" ].join("-")   #=> "a-1-2-x-y-b"
			
			# _______________________________________________________________________________________________
			# Delete / Remove Blanks
				arr =  [1, 2, 3, 4, 5, 6]
				arr.pop #=> 6				removes the last element in an array and returns it
				arr #=> [1, 2, 3, 4, 5]
				arr.shift #=> 1				retrieve and at the same time remove the first item
				arr #=> [2, 3, 4, 5]
				arr.delete_at(2) #=> 4		delete an element at a particular index:
				arr #=> [2, 3, 5]
				arr = [1, 2, 2, 3]
				arr.delete(2) #=> 2			delete a particular element anywhere in an array
				arr #=> [1,3]

				arr = ['foo', 0, nil, 'bar', 7, 'baz', nil] 
				arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']			# remove nil values from an array
				arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
				arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']			# Destructive - remove nil values from an array
				arr          #=> ['foo', 0, 'bar', 7, 'baz']

				["a", "", "b", " "].reject { |e| e.strip.empty? } # => ["a", "b"]

				scores = [ 97, 42, 75 ]
				scores.delete_if {|score| score < 80 }   #=> [97]
				scores.keep_if {|v| v < 80 }    #=> [42, 75]

				arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]			# Non-Destructive
				arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]				remove duplicate elements from an array.
				arr #=> [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
				arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]			# Destructive
				arr.uniq! #=> [2, 5, 6, 556, 8, 9, 0, 123]
				arr #=> [2, 5, 6, 556, 8, 9, 0, 123]
			# _______________________________________________________________________________________________
			# BSearch

			# _______________________________________________________________________________________________
			# Compare / Combine Arrays
				# Array Difference - Returns a new array that is a copy of the original array, removing all occurrences of any item that also appear in other_ary.
				[ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]  #=>  [ 3, 3, 5 ]

				# difference(other_ary1, other_ary2, ...) → new_ary		order is preserved from original arrays
				[ 1, 1, 2, 2, 3, 3, 4, 5 ].difference([ 1, 2, 4 ])     #=> [ 3, 3, 5 ]
				[ 1, 'c', :s, 'yep' ].difference([ 1 ], [ 'a', 'c' ])  #=> [ :s, "yep" ]
				
				# Set Intersection — Returns a new array containing unique elements common to the two arrays. The order is preserved from the original array.
				[ 1, 1, 3, 5 ] & [ 3, 2, 1 ]                 #=> [ 1, 3 ]
				[ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]   #=> [ 'a', 'b' ]

				# Repetition
				[ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]	returns a new array built by concatenating the int copies of self.
				[ 1, 2, 3 ] * ","  #=> "1,2,3"							With a String argument, equivalent to ary.join(str).

				[ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1		less than
				[ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1		greater than
				[ 1, 2 ]             <=> [ 1, :two ]         #=> nil	

				[ "a", "c" ]    == [ "a", "c", 7 ]     #=> false
				[ "a", "c", 7 ] == [ "a", "c", 7 ]     #=> true
				[ "a", "c", 7 ] == [ "a", "d", "f" ]   #=> false

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#      NESTED ARRAY ELEMENTS
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# SORTING NESTED HASH ELEMENTS
				names = [{name: "John"}, {name: "Jane"}, {name: "Bill"}]
				names.sort_by { |h| h[:name] }
				# => [{:name=>"Bill"}, {:name=>"Jane"}, {:name=>"John"}]
				meals.max do |meal_a, meal_b| meal_a.tip <=> meal_b.tip end
			# _______________________________________________________________________________________________
			# .assoc(obj) - Searches Array of Arrays comparing obj with first element of each contained array using obj.==
				a = [["colors", "red", "blue", "green"], ["letters", "a", "b", "c"], "foo"]
				a.assoc("letters")  #=> [ "letters", "a", "b", "c" ] eturns the first associated array that matches, or nil if no match is found
				a.assoc("foo")      #=> nil
			# _______________________________________________________________________________________________
			# dig(idx, ...) → object or nil	Extracts nested value specified by the sequence of idx objects by calling dig at each step
				a = [[1, [2, 3]]]
				a.dig(0, 1, 1)                    #=> 3
				a.dig(1, 2, 3)                    #=> nil
				a.dig(0, 0, 0)                    #=> TypeError: Integer does not have #dig method
				[42, {foo: :bar}].dig(1, :foo)    #=> :bar
			# _______________________________________________________________________________________________
			# 
				[ "a", [1, 2, [:x, :y]], "b" ].join("-")   #=> "a-1-2-x-y-b"
			# _______________________________________________________________________________________________
			#  Sort nested objects & return object w/ max or min value
				def self.oldest_customer
				    oldest_age = 0
				    oldest_customer = nil
				    self.all.each do |customer| if customer.age > oldest_ageoldest_age = customer.ageoldest_customer = customer end end
				    oldest_customer
				end

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# 		ITERATING
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# EACH - this operation leaves the array unchanged
				arr = [1, 2, 3, 4, 5]
				arr.each {|a| print a -= 10, " "} # prints: -9 -8 -7 -6 -5
				a.each_index {|x| print x, " -- " } # prints: 0 -- 1 -- 2 -- 3 -- 4 --

				words = %w[first second third], str = ""
				words.reverse_each {|word| str += "#{word} "}
				str #=> "third second first "
			# _______________________________________________________________________________________________
			# COLLECT / MAP {|item| block} → new_ary
				arr = [1, 2, 3, 4, 5]
				arr.map {|a| 2*a}     #=> [2, 4, 6, 8, 10]
				arr                   #=> [1, 2, 3, 4, 5]
				arr.map! {|a| a**2}   #=> [1, 4, 9, 16, 25]
				arr                   #=> [1, 4, 9, 16, 25]
			# _______________________________________________________________________________________________
			# SELECTION (NON-DESTUCTIVE) - return a new array with the selected elements
				arr = [1, 2, 3, 4, 5, 6]
				arr.select {|num| num.even? }       #=> [2, 4, 6]		
				arr.reject {|a| a < 3}       #=> [3, 4, 5, 6]			
				arr.drop_while {|a| a < 4}   #=> [4, 5, 6]
				a = %w[ a b c d e f ]
				a.select {|v| v =~ /[aeiou]/ }    #=> ["a", "e"]

			# _______________________________________________________________________________________________
			# DESTRUCTIVE SELECTION
				arr = [1, 2, 3, 4, 5, 6]
				arr.select! {|a| a > 3}       #=> [4, 5, 6]
				arr.reject! {|a| a < 3}       #=> [3, 4, 5, 6]
				arr.delete_if {|a| a < 4}   #=> [4, 5, 6]
				arr.keep_if {|a| a < 4}   #=> [1, 2, 3]

			# _______________________________________________________________________________________________
			# Find_index
				a = [ "a", "b", "c" ]
				a.index("b")              #=> 1
				a.index("z")              #=> nil
				a.index {|x| x == "b"}    #=> 1
			# _______________________________________________________________________________________________
			# 
			# 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#      Modify 
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# .flatten(level) → new_ary
				a = [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
				a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
				a = [ 1, 2, [3, [4, 5] ] ]
				a.flatten(1)              #=> [1, 2, 3, [4, 5]]
			# _______________________________________________________________________________________________
			# flatten!(level) → ary or nil
				a = [ 1, 2, [3, [4, 5] ] ]
				a.flatten!   #=> [1, 2, 3, 4, 5]
				a.flatten!   #=> nil
				a            #=> [1, 2, 3, 4, 5]
			# _______________________________________________________________________________________________
			# 
				[ "a", "b", "c" ].to_s     #=> "[\"a\", \"b\", \"c\"]"
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#      
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 

# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
#      
# :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
			# _______________________________________________________________________________________________
			# 
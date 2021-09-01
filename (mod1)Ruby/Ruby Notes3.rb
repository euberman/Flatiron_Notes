# birthday_kids = {
#   "Timmy" => 9, 
#   "Sarah" => 6, 
#   "Amanda" => 27
# }

def happy_birthday(birthday_kids)
  birthday_kids.each do |kids_name, age|
    puts "Happy Birthday #{kids_name}! You are now #{age} years old!"
  end
end

#------------------------------------------------------------------------------------------------------

def reverse_each_word(str)
  str.split.collect {|item| item.reverse}.join(" ")
end

#------------------------------------------------------------------------------------------------------

names = game_hash[:home][:players].map {|player| player[:player_name]}

player_stats = game_hash[:home][:players].find do |player| player[:player_name] == example_player_hash[:player_name] end

#------------------------------------------------------------------------------------------------------
# CONDITIONALS
# good - it's apparent what's going on
kind = case year
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       else 'Jazz'
       end

result = if some_cond
           calc_something
         else
           calc_something_else
         end

#------------------------------------------------------------------------------------------------------
# Set default values for methods
def some_method(arg1 = :default, arg2 = nil, arg3 = [])
  # do something...
end

#------------------------------------------------------------------------------------------------------
# REMOVE BLANK ELEMENTS FROM ARRAY



#------------------------------------------------------------------------------------------------------
# _____________________________________________________________________________________________________
# SORTING NESTED ARRAY ELEMENTS

names = [{name: "John"}, {name: "Jane"}, {name: "Bill"}]
names.sort_by { |h| h[:name] }
# => [{:name=>"Bill"}, {:name=>"Jane"}, {:name=>"John"}]


#------------------------------------------------------------------------------------------------------
# BEST WAY TO ITERATE THROUGH ARRAY

each: # for when don’t often care about the indexes
each_with_index: # you get the value and the index
each_index: # just the indexes
map: # useful when you want to transform one array into another
select: # when you want to choose a subset
inject: # for generating sums or products, or collecting a single result


#------------------------------------------------------------------------------------------------------
# 
#------------------------------------------------------------------------------------------------------

browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count #=> 5

#------------------------------------------------------------------------------------------------------



#------------------------------------------------------------------------------------------------------



#------------------------------------------------------------------------------------------------------
$states = {
  OR: ['Oregon',['Portland', 'GrantsPass', 'Monkeyville']],
  FL: ['Florida',['Jupiter', 'Tampabay', 'Orlando']],
  CA: ['California',['WalnutCreek', 'SanJose', 'Alameda']],
  NY: ['New York',['New York', 'Manhattan', 'Rochester']],
  MI: ['Michigan',['Detroit', 'Bankruptville','Fordtough']],
}

#task 4
$taxes = {
  OR: 10,
  FL: 15,
  CA: 20,
  NY: 50,
  MI: 8,
}

#task 3... describe state
def describe_state(state)
  $states[state.to_sym].last.join(' ,')
end

#task 5 
def calculate_tax(state, dollar)
  $taxes[state.to_sym] * dollar / 100
end

#task 6?????? take as input the name of a city.. return state code for that city

def find_state_for_city(user_city)
  found = false
  $states.each do |statekey, stateinfo|
    if stateinfo[1].map{|x| x.downcase}.include?(user_city.downcase)
      found = statekey
      end
    end
    if found 
      puts "Ah #{user_city} is in #{found}"
    else
      puts "we didnt find your city, try again sucka!"
    end
end

print "What state code do you want to learn about? "
  state = gets.chomp.upcase
puts "#{state}, which stands for #{$states[state.to_sym].first}, has cities like #{describe_state(state)}"

print "How much do you want to spend? "
  dollar = gets.chomp.to_i
puts "If you spend $#{dollar} you will pay $#{calculate_tax(state, dollar)} in taxes = ($#{dollar + calculate_tax(state, dollar)}) " 
  
print "Name a city that is part of the list providied "
user_city = gets.chomp.capitalize
    
find_state_for_city(user_city)


require 'pry'

# def fizzbuzz(num1, num2)
#   array = (num1..num2).to_a
#   output = ''
#   array.each do |n| 
#     if n % 3 == 0 && n % 5 == 0
#       output << 'FizzBuzz.'
#     elsif n % 3 == 0
#        output << 'Fizz, '
#     elsif n % 5 == 0
#       output << 'Buzz, '
#     else
#       output << "#{n}, "
#     end
#   end
#   p output
# end

# #input 
# fizzbuzz(1, 15) 

# # output 
# # 1, 2, 'Fizz', 4, 'Buzz', 6, 7, 8, 'Fizz', 'Buzz', '11', 'Fizz', 13, 14, 'FizzBuzz'


# Given array of hashes iterate over array of hashes and select key, value pairs that meet the filteirng hash criteria. 

PRODUCTS = [
  { name: "Thinkpad x210", price: 220},
  { name: "Thinkpad x220", price: 250}
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

# FIRST ATTEMPT. Realized that I must store the value of select when calling it within a method, since the method's ending end will always return 'nil' since ruby always evaluates last line.

def search(query) 
  PRODUCTS.select do |element|
    p query[:price_min] < element[:price] && element[:price] < query[:price_max] && element[:name].start_with?(query[:q].capitalize) # using p, we can inspect the rest. We will only see a false and true, and not the actual hash for which those boolean expressions evaluatue to false or true. 
  end # if this end was not here, the above code would work, however, this end will return nil when evaluated and so we must store value of select above, and return it on after this end
end


def search(query) 
  PRODUCTS.select do |element|
    p query[:price_min] < element[:price] && element[:price] < query[:price_max] && element[:name].start_with?(query[:q].capitalize)
  end
end


def search(query) # SOLUTION
ans = []
  ans = PRODUCTS.select do |element| # ans variable will contain result of select method
        query[:price_min] < element[:price] && element[:price] < query[:price_max] && element[:name].start_with?(query[:q].capitalize)  
  end
  p ans
end

search(query)

# output: 
# [{name: "Thinkpad x220, price: 250"}]



































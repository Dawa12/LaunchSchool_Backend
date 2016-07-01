10.times { |number| puts (" " * number) + "The Flintstones Rock!" }


# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end


# Question 4: https://launchschool.com/lessons/263069da/assignments/3725 
numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p "#{index}  #{numbers.inspect}  #{number}"
  numbers.shift(1)
end



def factor(number)
  dividend = number
  divisors = []

  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0 
    dividend -= 1
  end

divisors

end



# titleize method 
=begin 
Modify the existing string such that the first letter of each word is capitalized. 
Iterate through each word in the string. 

"hello my name is dawa"
Start with the first word, and capitlize the first letter
Proceed to the next word in the sequence and capitalize it
Proceed to the next word in the sequence and capitalize it 
Repeat until you get to the last word, and then display the modified string

- require a loop to iterate over each word in string. Use map
- modify caller 
- capitalize first letter of each word # capitalize!
    Will need to separte all words into separate strings to capitalize them all. Use # split
- after appliying capitlize! to all methods, then join separte words into one string using .join(" ") (since split method returns an array, we must use .join, which is available only to arrays. 
- finally, we must display modified caller to the user by stating the variable name
=end

- require a loop to iterate over each word in string. Use map

string = "hello my name is dawa"

def titleize!(string)
string = string.split.map! { |word| word.capitalize! }.join(" ")
  p string
end

=begin
- initilzie a new method named titleize!
- Will need to separate all words into separate strings to capitalize them all. Use # split
- Only after using split, do we have an array, and can we now use #map, to iterate over each element. 
- use #capitilize on each string element
- join separte words into one string using .join(" ") (since split method returns an array, we must use .join, which is available only to arrays. 
- finally, we must display modified caller to the user by stating the variable name

result: failed to discover while the method didn't mutate caller 
=end


=begin
Given a hash
Insert age_group key into  hash using << on the v variable of (k,v)
  Create conditional. age / age range variables
  Use case statement with range objects

use map to loop / iterate over all the hashes 

=end

age_group = case age
  when 0..17 then "kid"
  when 18..64 then "adult"
  else "senior"
  end

munsters.each do |key, value| 
  value["age_group"] = case value["age"]
  when 0..17 then "kid"
  when 18..64 then "adult"
  else "senior"
  end
end


# my approach: 
munsters.map do |k,v| 
  age_group = case "age"
              when 0..17 then "kid"
              when 18..64 then "adult"
              else "senior"
              end

  munsters[k].merge("age_group" => age_group)
end


# lots of time spent figuring out nomethod error for <<. Opted to use #merge! instead. Lots of time on stackoverflow, reading up on different methods / error messages. Lots of IRB testing (1.5hrs. total in this problem)
# worked out case logic separately since it was easier


=begin
access the value of the hash
access the gender key
run condition test on gender to see if it's male 
if it's male, store the value of age
iterate this conditional test over all persons 
=end


# access the value of the hash
munsters[name, details]
munsters[details]

# access the gender key
munsters[details]["gender"]

# run condition test on gender to see if it's male 
if munsters[details]["gender"] == male 

else

end

# if it's male, store the value of age
# iterate this conditional test over all persons
# calculate total age with #inject[:+]


munsters.map do |name, details|
  if munsters[details["gender"]] == "male"
    p munsters[details["age"]].inject[:+]
  else 
    break
  end
end




=begin
Inputs 
- hash
- ages 
- 

Outputs:
- sum of all ages

Approach: 



=end



=begin
iterate over each key-value pair
add age_group key-value 
  use case statements on age 



=end

munsters = munsters.each do |name, description|
age = munsters[name]["age"]
age_group = munsters[name]["age_group"]
age_group = case age
            when 0..17 then "kid"
            when 18..64 then "adult"
            else "senior"
            end
end


munsters.each do |name, details|
  case details["age"]
  when 0..17
    details["age_group"] = "kid"
  when 18..64
    details["age_group"] = "adult"
  else
    details["age_group"] = "senior"
  end
end
=begin
LESSONS: 
- do not have to call munsters when accessing "details". Can do so directly 
- prefer to put "then clause" on bottom line instead of using "then"
=end






























=begin
iterate over each hash using each
conditional to determine if gender is "male"
store value of male age, and add to next male age (use inject)

bugs: 
does not accept +=. Possibly due to different number formats || due to another error before it 


=end

total_male_age = 0 # initialize outside block so that you can access this variable later in your program 
munsters.map do |name, details|
  total_male_age += details["age"] if details["gender"] == "male" # use of if statement here does not require own "end" 
end


=begin
iterate over each hash
receive a string
  insert variables for right words
print string
 
=end

# iterate over each hash
# receive a string
#   insert variables for right words
# print string

string = ''
user_name = ''
age = ''
gender = ''

munsters.map do |name, details|
user_name = name
age = details['age']
gender = details['gender']

string = "#{user_name} is a #{age} year old #{gender}"

end

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end



# Medium 2 - Question 3: 
=begin
given a 'trciky method', refactor it to make its function and resulting output more obvious to the programmer

split method into two separate methods. One with a bang(!), and another without, since it does not modify caller 

=end

def tricky_string_method(a_string_param)
  a_string_param += "rutabaga"
end

my_string = "pumpkins"
tricky_string_method(my_string)

puts "My string looks like this now: #{my_string}"

def tricky_array_method!(an_array_param)
  an_array_param << "rutabaga"
end



def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  # return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"



# Question 4 (time: 17 min)
=begin
given string 
split string into array of words using # split
iterate over each word in string
reassign 'sentenece' variable to reverse order of words
put array of words back into string using # join
optimize code further 
=end

sentence = sentence.split.reverse.join(' ')



=begin

given hexidecimal character - define limits of hexidecimal (list hexidecimal via array)
assign 32 hexidicimal characters
break appropriately with hyphen into 5 sections 
randomize hexidecimals via # sample methods? 
define method without parameter 
confert hexadecimal into a string 

=end


def uuid
hexadecimals = [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" ]
sample_uuid = "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

sample_uuid.split(//).each { |x| x.replace(hexadecimals.sample) unless x == '-' }.join
end



=begin
is string dot separated? 
string has only 4 components? 


is string a number? #is_a_number?


#not returning a false condition in current code 

=end

ip = "22.3.1.2"

string = "22.3.1.2"
def dot_separated?(string)
a = string.split('.')
  if a.count == 4 && a.each { |x| is_a_number?(a) }
    puts "yes this is an IP since it has 4 sections, each section is an integer"
  else
    puts "no this isn't an IP, since it does not have 4 sections, and / or each section is not an integer"
  end
end


=begin
ip address is: 
- is dot separated? into 4 sections? 
  - return false unless ip.split('.').count == 4
- a number in all 4 sections? 
  - is_a_number?(ip) #is_a_number? is already provided
  # need to loop over each of the 4 sections and test if it's a number



return true / fase 

=end




























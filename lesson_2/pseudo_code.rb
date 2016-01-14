=begin
Goal: practice writing pseudo-code, formal pseudo-code, and finally translating them into ruby

1) initialize method that will find the greatest number in a set of numbers
<--Pseudo-Code-->
Given a collection of integers

Iterate through the collection in increments of 1
  Save the first value as the starting value 
  in each step of the iteration, compare the starting value (saved value) with the current value
  if the saved value is greater than or is the same
      move to the next value in the collection
  Otherwise, if the current value is greater
    reassign the saved value to the current value
After iteration of all integers in the set is complete, present the saved value.


<--Formal Pseudo-code-->

START

# Given a collection of integers called "numbers"

SET iterator = 1
SET saved_number = value within numbers collection at space 1

WHILE iterator < lenght of numbers
  SET current_number = value within numbers collection at space "iterator"
  IF saved_number >= current_number
    go to the next iteration 
  ELSE
    saved_number = current_number

  iterator = iterator + 1

PRINT saved_number
END
=end

# <--ruby code-->

def find_greatest(number)
  saved_number = nil

  numbers.each do |num|
      saved_number ||= num
      if saved_number >= num
          next
      else
          saved_number = num
      end
    end

    saved_number
  end


=begin

Exercise 1: Initialize a method that returns the sum of two integers

<--standard pseudo-code-->

need: operator, integer 1, integer 2, method that accepts two parameters

Create a method that accepts two integers within its parameter
  Add integer1 with integer2

<--formal-->

START

SET integer1 = value from user
SET integer2 = value from user

New_method(integer1, integer2)
add integer1 + integer 2

END

2) a method that takes an array of strings, and returns a string that is all those strings concatenated together

Given a set of strings
  while iterating over the value of the strings:
    save the value of the first string
    Add the saved value to the current string value via concatenation
    continue procedure until the last string
  Output the saved value

<--formal-->
START 
# Given collection of strings called "string_set"

SET iterator = 1
SET saved_string = value within string_set collection at space 1
SET current_value = value of string_set collection at space "iterator"

While iterator =+ 1, 
  Concatenate saved_string + current_value and save value into saved_string
  until reaching the last string in string_set
    then display saved_string

3)a method that takes an array of integers, and returns a new array with every other element

Given a collection of integers.

Iterate through the collection one by one
- save the first value as starting value
- continue to save the value of only every other iteration

After iterating through the entire collection, return the saved values as a data set


START
# Given a collection of integers.

SET iterator = 1
SET new_array = value within integer collection, of at space 1


SET saved_number = value wihin numbers collection at space 1
Iterate through the collection one by one
- save the first value as starting value
- continue to save the value of only every other iteration

PRINT new_array


=end



















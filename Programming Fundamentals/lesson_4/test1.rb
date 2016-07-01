=begin 
2:22 (Dubstep problem)
  - took notes, rephrased key points of instructions in comments 
  - (2:25) - initiailzed method song_decoder to accept string - printed the string to screen. Method initialized successfully, and not have to build on top of it 
  - (2:30) - finished outlining the inital logic and approach to the problem 

  - 2:41 - having success with poping and shifting first and last three letters if they are WUB, working on looping this until no more first or last WUBs


def song_decoder(string)
  arr = string.split(//)
  p arr

  loop do 
    arr.shift(3) if string[0, 3] == "WUB"
    arr.pop(3) if string[-3, 3] == "WUB"
    
  end

  p arr

end


  - 2:52 finally got a working loop, which removes all 'WUB's at beginning and end of string 
  - Was confused on how to break out of the loop. Was considering combining count with times method to figure out how many time to execute shift and pop methods. Was considering using times method instead of the loop. 



def song_decoder(string)
  arr = string.split(//)

  loop do 
    arr.shift(3) if string[0, 3] == "WUB"
    arr.pop(3) if string[-3, 3] == "WUB"
    p arr
    break if arr[0, 3] != "WUB" && arr[-3, 3] != "WUB"
  end

  p arr

end


  3:07 - finally got gsub! to work and now have the correct output. Only need to make small adjustment of removing extra spaces, when 'wub' repelated more than once. Couldn't find in docs, so google searched and found answer on stack overflow

  arr = arr.join.gsub!('WUB', ' ').split.join(' ') # will replace middle 'WUB's with space, and split and join removes duplicate spaces


  3:12 - completed exercise (50 min.) - feel like this did take a very long time, but every moment of it was useful, since I was breaking things down and making many notes. I didn't have to take any breaks during this exercise, and could better observe my thought process. 



codewars - keeping in mind input and what output should look like 

"WUB" random number of times (may be 0 times) before first word, and after last word
  But must be included at least 1 time between words, can be random times as well though

input: 
song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")

output: 
=&gt;  WE ARE THE CHAMPIONS MY FRIEND


Logic: 
  - convert string into array of letters using split(//)
    - check if first 3 index are wub, if so delete - loop and repeat 
    - repeat check for last 3 index and see if they are wub
    - break loop if first 3 and last 3 letters are no longer 'WUB'
  - Finally, replace all wub in array with ' ' (since only middle wubs are left, they should be spaces)

=end

def song_decoder(song)
  arr = song.split(//)

  loop do 
    arr.shift(3) if song[0, 3] == "WUB"
    arr.pop(3) if song[-3, 3] == "WUB"
    break if arr[0, 3] != "WUB" && arr[-3, 3] != "WUB"
  end

  p arr.join.gsub!('WUB', ' ').split().join(' ')
end

song_decoder("WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB")



=begin 
confused on shift / unshift and had to review ruby docs on array mehtod. 
confsued on join method and what parameter to pass. realized I just needed join, without any parameter to combine without spaces.

searching docs for how to select first 3 letters of a song. Needed string[0, 3] (start with index 0, return 3 letters)

spent time seraching for array method that will allow me to find all 'WUB's and replace with " "
  - thinking to just convert arry into string and apply gsub method 


why p creates new line when doing p "#{arr} hello" - creates new lines on string interpolation only 

confused on the gsub vs. gsub! didn't realzie there was a destrutive version 



=end






























require 'pry'


  def run_method
expected = "msemo aanin dnin ndla etlt shui"
actual = "msemo aanin dninn dlaet ltshu i"

crypto = "madnessandthenillumination"
ciphertext = "msemoaanindninndlaetltshui"
plaintext_segments = ["madnes", "sandth", "enillu", "minati", "on"]

    temp = ''
    ini = 5
    num = 1
    ciphertext_new = ciphertext[0..(ini-1)]

    ciphertext.size.times do |time|
      var = plaintext_segments.size

binding.pry
      inx = ciphertext[ini, var].index(ciphertext[ini, var].split('').detect{|element| element == crypto[num]})
      puts 'nil' if inx.nil?
      ciphertext_new += ciphertext[ini, var].insert((inx), ',')
      
      ini += 5
      num += 1
    end

    ciphertext.gsub(',', ' ').strip

    return temp
  end

  run_method
  
    
    # ciphertext = ciphertext[ini, var].gsub(/(.{#{inx}})/, '\1 ')   
    # ciphertext[ini, var].index(ciphertext[ini, var].split('').detect{|element| element == crypto[num]})
    
    # find index where we detect ciphertext[num] and then add ','
    # loop and iterate
    # gsub all ',' for ' ' all at once

=begin
- 


=end




  # plaintext_segments[0].size.times do |num|
  #   var = plaintext_segments.size

    # until index == plaintext_segments[0].size
    #   ciphertext[0..var].index(ciphertext[0..var].split('').detect{|element| element == crypto[index]})

    




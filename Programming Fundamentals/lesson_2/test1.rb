# program fails to execuite. Due to line 87 case logic not adding integers. Why doesn't program store integer / float value from line 57 & 66?

require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang = LANGUAGE)
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message}")
end

def integer?(input)
  input.to_i.to_s == input
end

def float?(input)
  input.to_f.to_s == input
end

def number?(input)
  integer?(input) || float?(input)
end

def operating_to_message(operator)
  word = case operator
         when '1' then 'Adding'
         when '2' then 'Subtracting'
         when '3' then 'Multiplying'
         when '4' then 'Dividing'
         end
end

prompt('welcome')

user_name = ''
loop do
  user_name = Kernel.gets().chomp()
  break unless user_name.empty?() || number?(user_name)
  prompt('valid_name')
end

prompt('greeting')

number1 = ''
loop do
  prompt('first_number')
  loop do
    number1 = Kernel.gets().chomp()
    if number1 % 1 != 0 then number1.to_f
      else number1.to_i
    end

    break if number?(number1)
    prompt('invalid_number')
  end

  number2 = ''
  prompt('second_number')
  loop do
    number2 = Kernel.gets().chomp()
    if number2 % 1 != 0 then number2.to_f
      else number2.to_i
    end

    break if number?(number2)
    prompt('invalid_number')
  end

  operator_prompt = 'multi_line_string'
  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    break if %w(1 2 3 4).include?(operator)
    prompt('choose_operator')
  end

  Kernel.puts(operating_to_message(operator) + " numbers...")

  result = case operator
           when '1' then number1 + number2
           when '2' then number1 - number2
           when '3' then number1 * number2
           when '4' then number1 / number2
           end

  operator_symbol = case operator
                    when '1' then '+'
                    when '2' then '-'
                    when '3' then '*'
                    when '4' then '/'
                    end

  Kernel.puts("#{number1} #{operator_symbol} #{number2} = #{result}")

  prompt('calculate_again?')
  answer1 = Kernel.gets.chomp()
  break unless answer1.downcase.start_with?('y')
end

prompt('goodbye')

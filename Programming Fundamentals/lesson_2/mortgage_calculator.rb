def prompt(string)
  Kernel.puts("=> #{string}")
end

prompt("Hello, welcome to this mortgage calculator. What's your name?")

user_name = ''
loop do
  user_name = Kernel.gets().chomp()

  if user_name.empty?()
    prompt("Please enter a name")
  else
    break
  end
end

prompt("Thank you, #{user_name}")

amount = ''
loop do
  loop do
    prompt("What is your loan amount?")

    amount = Kernel.gets().chomp()
    if amount.empty?() || amount.to_f < 0
      prompt("Please enter a positive number")
    else
      break
    end
  end

  prompt("You entered #{amount}. What is your APR?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  interest_rate = ''
  loop do
    interest_rate = Kernel.gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f < 0
      prompt("You need to enter a positive number!")
    else
      break
    end
  end

  prompt("You entered #{interest_rate}. What is your loan duration? (in years)")

  years = ''
  loop do
    years = Kernel.gets().chomp()

    if years.empty?() || years.to_i < 0
      prompt("Please enter a valid number")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i() * 12

  monthly_payment = amount.to_f() *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**-months.to_i()))

  prompt("Your monthly payment is: $#{format('%02.2f', monthly_payment)}")
  prompt("Another calculation?")

  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
prompt("Good bye!")

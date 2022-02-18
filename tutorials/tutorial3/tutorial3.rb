continue = TRUE
while (continue)
  puts "Enter first number:"
  num1 = gets.chomp.to_i

  puts "Choose operator: [+], [-], [*], [/]"
  response = gets.chomp

  puts "Enter second number:"
  num2 = gets.chomp.to_i

  case response
  when "+"
    answer = num1 + num2
  when "-"
    answer = num1 - num2
  when "*"
    answer = num1 * num2
  when "/"
    answer = num1 / num2
  end

  puts "The answer is... #{answer}. Do u want to continue [y/n]?"
  continue = (gets.chomp.downcase == "y")
end

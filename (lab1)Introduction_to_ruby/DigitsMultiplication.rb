def miltiply(element)
  multiplication = 1
  while element > 0
    last_digit = element % 10
    if last_digit != 5 
      multiplication = multiplication * last_digit
    end
    element = element / 10 
  end 
  return multiplication 
end 

number = 56125
puts "Произведение цифр числа, не делящихся на 5: #{miltiply(number)}"

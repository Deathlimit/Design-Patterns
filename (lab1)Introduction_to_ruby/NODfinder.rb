def NOD_finder(element1, element2)
  if element1 != nil
    while element1 != 0 && element2 != 0
      if element1 >  element2
        element1 %= element2
      else
        element2 %= element1
      end
    end
      nod = element1 + element2
      return nod
  end
  return nil
end

def max_nechet_neprost_del_finder(element)
  max_del = nil
  (1..element).reverse_each do |i|
    if element % i == 0 && i % 2 != 0 && is_prostoe?(i) == false 
      max_del = i
      return max_del
    end
  end 
  return nil
end

def is_prostoe?(element)
  count_delitel = 0
  for i in (2..element-1)
    if element % i == 0 
      count_delitel+=1
    end
  end
  if (count_delitel==0) 
    return true
  else 
    return false
  end
end

def digits_multiplication(element)
  multiplication = 1
  while element > 0 
    multiplication *= element % 10
    element /= 10
  end
  return multiplication
end

number = 21225
puts "Максимальный нечётный непростой делитель числа: #{max_nechet_neprost_del_finder(number)}"
puts "Произведение цифр числа: #{digits_multiplication(number)}"
puts "НОД найденных чисел: #{NOD_finder(max_nechet_neprost_del_finder(number), digits_multiplication(number))}"
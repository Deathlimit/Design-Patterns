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

def max_prostoi_del(element)
  max_del = 1
  for i in (2..element)
    if (element % i == 0) and (is_prostoe?(i))
      max_del=i
     end
   end
  return max_del
end 

number = 11
puts "Максимальный простой делитель числа: #{max_prostoi_del(number)}"
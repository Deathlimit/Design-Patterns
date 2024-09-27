def min_element_finder (elements)
    min_element = elements[0]
    for element in elements
        if element<min_element then
            min_element = element
        end
    end
    return min_element
end

def first_positive_element_finder (elements)
    i=0
    for element in elements
        if element > 0 then
            return i
        end
        i+=1
    end
    return nil
end
            
puts "Вводите элементы. (Введите 0 для остановки ввода)"
elements = []
element = $stdin.gets.chomp.to_i
while element != 0
    elements << element
    element = $stdin.gets.chomp.to_i
end
puts "Минимальный элемент: #{min_element_finder(elements)}"
puts "Номер первого положительного числа: #{first_positive_element_finder(elements)}"
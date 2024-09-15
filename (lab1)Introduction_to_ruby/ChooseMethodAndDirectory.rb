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
    return "Положительное число не найдено."
end
  
method_number = ARGV[0].to_i
file_path = ARGV[1]
begin
    elements = File.read(file_path).split.map(&:to_i)
rescue Errno::ENOENT
    puts "Файл не найден по указанному пути!"
    exit
end
case method_number
when 1
  puts "Минимальный элемент: #{min_element_finder(elements)}"
when 2
  puts "Номер первого положительного числа: #{first_positive_element_finder(elements)}"
else
  puts "Неверный номер метода. (1 - для поиска минимального элемента; 2 - для поиска номера первого положительного числа)"
end


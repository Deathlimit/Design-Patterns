def symm_diff(l1, l2)
    uniq_l1 = l1.select { |element| l1.count(element) == 1 }
    uniq_l2 = l2.select { |element| l2.count(element) == 1 }
    (uniq_l1 | uniq_l2) - (uniq_l1 & uniq_l2)
end

def count_elements_between(arr)
    min_value = arr.min
    first_min = arr.index(min_value)
    last_min = arr.rindex(min_value)
    yield(first_min, last_min)
end

def count_elements_in_range(arr, range)
    arr.count { |element| range.include?(element) }
end

def find_min_index(arr)
    arr.each_with_index.min_by { |value, index| value }[1]
end
  
puts "Выберите способ ввода данных:
                    \n1. Ввести с клавиатуры
                    \n2. Прочитать из файла строку
                    \n3. Прочитать из файла списки"
input_choice = gets.chomp
  
case input_choice
    when "1"
        puts "Введите целые числа через пробел:"
        arr = gets.chomp.split.map(&:to_i)
    when "2"
        begin
        file = File.open('C:\ruby\Blocks_collections_etc\input.txt', "r")
        arr = file.read.split.map(&:to_i)
        puts "Файл подключен успешно!"
        rescue Errno::ENONET => error
        puts "Обнаружена ошибка при работе с файлами: #{error}"
        exit
        ensure
        file.close if file
        end
    when "3"
        begin
        file = File.open('C:\ruby\Blocks_collections_etc\input_list.txt', "r")
        l1 = file.read.split.map(&:to_i)
        l2 = file.read.split.map(&:to_i)
        puts "Файл подключен успешно!"
        rescue Errno::ENONET => error
        puts "Обнаружена ошибка при работе с файлами: #{error}"
        exit
        ensure
        file.close if file
        end
    else
        puts "Некорректный выбор. Завершение программы."
        exit
end
  
puts "Выберите задачу:
        \n1. Найти индекс минимального элемента
        \n2. Найти количество элементов в заданном интервале
        \n3. Найти количество элементов между первым и последним минимальным
        \n4. ???
        \n5. Построить новый список, состоящий из элементов, встречающихся только в одном из этих списков и не повторяющихся в них"
method_choice = gets.chomp
puts
puts arr
case method_choice
    when "1"
        puts "Индекс минимального элемента: #{find_min_index(arr)}"
    when "2"
        puts "Введите начальное значение диапазона:"
        start_num = gets.chomp.to_i
        puts "Введите конечное значение диапазона:"
        end_num = gets.chomp.to_i
        range = start_num..end_num
        puts "Количество элементов в интервале #{range}:  #{count_elements_in_range(arr, range)}"
    when "3"
        elements_count = count_elements_between(arr) { |first_min, last_min| (last_min - first_min - 1) }
        puts "Количество элементов между первым и последним минимальным значением: #{elements_count}"
    when "4"
        puts "???"
    when "5"
        symm_diff_result = symm_diff(l1, l2)
        puts "Симметрическая разность списков: #{symm_diff_result}"
    else
        puts "Некорректный выбор задачи."
    end

  
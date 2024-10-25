def find_min_index(arr)
    arr.each_with_index.min_by { |value, index| value }[1]
end
  
puts "Выберите способ ввода данных:\n1. Ввести с клавиатуры\n2. Прочитать из файла"
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
    else
        puts "Некорректный выбор. Завершение программы."
        exit
end
  
puts "Выберите задачу:\n1. Найти индекс минимального элемента"
method_choice = gets.chomp
puts
puts arr
case method_choice
    when "1"
        puts "Индекс минимального элемента: #{find_min_index(arr)}"
    else
        puts "Некорректный выбор задачи."
    end

  
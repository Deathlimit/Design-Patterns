puts "Привет, " + ARGV[0]
puts "Введите ваш любимый язык программирования: "
user_result = $stdin.gets.chomp
if user_result == "ruby"
    puts "ТЫ ПОДЛИЗА!!!"
else
    case user_result
        when "c++" then puts "Не модно, не стильно, не молодёжно"
        when "java" then puts "Маинкрафт сделан на джаве" 
        when "assembler" then puts "Соболезную..."
        when "python" then puts "Стильно, модно, молодёжно"    
    end
    puts "В принципе не важно, всё равно скоро будет ruby."
end

puts "Введите команду языка ruby:"
user_ruby_command = $stdin.gets.chomp
eval(user_ruby_command)
puts "Введите команду OC:"
user_os_command= $stdin.gets.chomp
system(user_os_command)
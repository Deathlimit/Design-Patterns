require_relative 'Student'

begin
    student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "+12223334444", git: "daniil-git")
    puts student1
    student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "+122233344")
    puts student2     
    student3 = Student.new("Петрова", "Мария", "Петрович", id: 3, git: "keks", telegram: "@meow")
    puts student3
    student1.set_contacts(phone: "1234567890", email: "ivanov@example.com")
    puts "\nОбновлённая информация о студенте:"
    puts student1.to_s
    student1.phone = "11223344"  # Ошибка: private method `phone='
    puts student1.to_s
  rescue ArgumentError => e
    puts e.message
  end



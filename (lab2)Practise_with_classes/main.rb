require_relative 'Student'

begin
    student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "+12223334444", git: "daniil-git")
    puts student1
    student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "+122233344")
    puts student2     
    student3 = Student.new("Петрова", "Мария", "Петрович", id: 3, git: "keks", telegram: "@meow")
    puts student3
    student4 = Student.new("Петрова", "Мария", "Петрович", id: 4, git: "keks", phone: "+12223334444", telegram: "@meow2")
    puts student4
    student1.set_contacts(phone: "1234567890", email: "ivanov@example.com")
    puts "\nОбновлённая информация о студенте:"
    puts student1
    puts student4.get_info
    student1.telegram = "888888888"  # Ошибка: private method `phone='
  rescue ArgumentError => e
    puts e.message
  end



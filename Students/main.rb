require_relative 'Student.rb'
require_relative 'Student_short.rb'
require_relative 'Student_base.rb'


begin
    student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "+12223334444", git: "daniil-git")
    puts student1

    student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "+122233344")
    puts student2     
    student3 = Student.new("Петрова", "Мария", "Петрович", id: 3, git: "keks", telegram: "@meow")
    puts student3
    student4 = Student.new("Петрова", "Мария", "Петрович", id: 14, git: "keks")
    puts student4
    student1.set_contacts(phone: "1234567890", email: "ivanov@example.com")
    puts "\nОбновлённая информация о студенте:"
    puts student1.contact
    info_str = student4.get_info

    puts info_str
    student_short1 = Student_short.by_string(info_str, 14)
    
    puts student_short1.git
    puts student_short1.contact
    student_short1.validate
    
  rescue ArgumentError => e
    puts e.message
  end



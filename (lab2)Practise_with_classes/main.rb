require_relative 'Student'
require_relative 'Student_short'
require_relative 'StudentBase.rb'


begin
    student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "+12223334444", git: "daniil-git")
    puts student1

    student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "+122233344")
    puts student2     
    student3 = Student.new("Петрова", "Мария", "Петрович", id: 3, git: "keks", telegram: "@meow")
    puts student3
    student4 = Student.new("Петрова", "Мария", "Петрович", id: 4, git: "keks")
    puts student4
    student1.set_contacts(phone: "1234567890", email: "ivanov@example.com")
    puts "\nОбновлённая информация о студенте:"
    puts student1
    puts student4.get_preferred_contact

    info_str = student1.get_info
    student_short1 = Student_short.new(student4)
    puts student_short1.last_name_initials 
    puts student_short1.git 
    puts student_short1.contact 
    student_short1.to_s
  rescue ArgumentError => e
    puts e.message
  end



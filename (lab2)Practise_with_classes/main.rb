require_relative 'Student'

begin
    student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "+12223334444", git: "daniil-git")
    puts student1
    student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "+12223")
    puts student2
  rescue ArgumentError => e
    puts e.message
  end



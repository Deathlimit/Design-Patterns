require_relative 'Student'

student1 = Student.new("Даниилов", "Даниил", "Даниилович", email: "daniil@test.com", id: 1, phone: "123456", git: "daniil-git")
student2 = Student.new("Петров", "Петр", "Петрович", id: 2, telegram: "@petr", git: "petr-git", phone: "789012")


puts student1
puts student2
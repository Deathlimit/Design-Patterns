require_relative 'Student.rb'
require_relative 'Student_short.rb'
require_relative 'Student_base.rb'
require_relative 'Student_tree.rb'


begin
  student1 = Student.new('Иванов', 'Иван', 'Иванович', birth_date: '2000-05-15', id: 1)
  student2 = Student.new('Петров', 'Петр', 'Петрович', birth_date: '1998-10-12', id: 2)
  student3 = Student.new('Сидоров', 'Сергей', 'Сергеевич', birth_date: '2002-03-20', id: 3)

  tree = Binary_student_tree.new
  tree.add(student1)
  tree.add(student2)
  tree.add(student3)

  tree.each { |student| puts student }

  puts
  puts
  puts
  puts student1 > student2 ? "1" : "2"
  end



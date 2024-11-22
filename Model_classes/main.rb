require_relative 'Data_list.rb'
require_relative 'Student_short.rb'
require_relative 'Student.rb'
require_relative 'Data_list_student_short.rb'
require_relative 'Data_table.rb'




student1 = Student.new('Иванов', 'Иван', 'Иванович', git: 'test1', email: 'danil@yandex.ru', id: 1)
student2 = Student.new('Иванова', 'Иван', 'Иванович', git: 'test2', email: 'danil@yandex.ru', id: 2)
student3 = Student.new('Ивановаа', 'Иван', 'Иванович', git: 'test3', email: 'danil@yandex.ru', id: 3)
st1 = Student_short.by_student(student1)
st2 = Student_short.by_student(student2)
st3 = Student_short.by_student(student3)

students = [st1, st2, st3]


data_list = DataListStudentShort.new(students)

puts "Имена атрибутов: #{data_list.get_names}" # ["ФИО", "Git", "Контакт"]

data_table = data_list.get_data
puts
puts data_table.column_count
puts

for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    puts (data_table.get_element(i, j))
  end
end



data_list.select(0)
data_list.select(2)

puts "Выделенные ID: #{data_list.get_selected}" 

  
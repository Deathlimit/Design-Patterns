require_relative 'Data_list.rb'
require_relative 'Student_short.rb'
require_relative 'Student.rb'
require_relative 'Data_list_student_short.rb'
require_relative 'Data_table.rb'
require_relative 'Students_list_JSON.rb'


st1 = Student.new( 
  "id": 7,
  "first_name": "AAРРешетка",
  "last_name": "AAДДаниил",
  "patronymic_name": "Тестовиччч",
  "birth_date": "2003-03-03",
  "telegram": "@test3",
  "email": "test3@gmail.com",
  "phone": nil,
  "git": "test3"
)

st2 = Student.new( 
  "id": 8,
  "first_name": "AAРРешетка",
  "last_name": "ББДДаниил",
  "patronymic_name": "Тестовиччч",
  "birth_date": "2003-03-03",
  "telegram": "@test3",
  "email": "test3@gmail.com",
  "phone": nil,
  "git": "test3"
)


json_test = Students_list_JSON.new('./students.json')
json_test.add_student(st1)
json_test.update_student(4, st2)
json_test.sort_by_full_name!
puts json_test.get_student_short_count
puts('-----------')
    
data_list = json_test.get_k_n_student_short_list(1, 5)
data_table = data_list.proceed_data_table
for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    print (data_table.get_element(i, j))
    print ("     | ")
  end
  puts
end

puts(json_test.get_student_by_id(4))

json_test.write_to_file





  
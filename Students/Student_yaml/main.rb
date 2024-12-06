require_relative 'Data_list.rb'
require_relative 'Student_short.rb'
require_relative 'Student.rb'
require_relative 'Data_list_student_short.rb'
require_relative 'Data_table.rb'
require_relative 'Students_list_YAML.rb'


st1 = Student.new( 
  "id": 7,
  "first_name": "AAРРешетка",
  "last_name": "AAДДаниил",
  "patronymic_name": "Тестовиччч",
  "birth_date": "2003.03.03",
  "telegram": "@test3",
  "email": "test3@gmail.com",
  "phone": nil,
  "git": "test4"
)



yaml = Students_list_YAML.new('./students.yaml')
yaml.add_student(st1)
yaml.write_to_file

data_list = yaml.get_k_n_student_short_list(1, 15)
data_table = data_list.proceed_data_table
for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    print (data_table.get_element(i, j))
    print ("     | ")
  end
  puts
end





  
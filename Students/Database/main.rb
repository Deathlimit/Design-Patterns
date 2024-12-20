require_relative 'student'
require_relative 'db_connection'
require_relative 'student_list_db'
require_relative 'data_list'
require_relative 'data_table'
require_relative 'DB_client.rb'
require 'date'

db_config = 'sqlite://students.db'
db_client = DB_Client.instance(db_config)
db_client.setup_schema
students_list = Students_List_DB.new()

st1 = Student.new( 
  id: 17,
  first_name: "AAРРешетка",
  last_name: "AAДДаниил",
  patronymic_name: "Тестовиччч",
  birth_date: "2003.03.03",
  telegram: "@test4444",
  email: "test7@sgmail.com",
  phone: nil,
  git: "test98898"
)

st2 = Student.new( 
  id: 17,
  first_name: "AAРРешетка",
  last_name: "AAДДаниил",
  patronymic_name: "Тестовиччч",
  birth_date: "2003.03.03",
  telegram: "@test4444",
  email: "test7@sgmail.com",
  phone: nil,
  git: "test121212"
)




puts "----------------------------------"
data_list = students_list.get_k_n_student_short_list(1, 15)
data_table = data_list.proceed_data_table
for i in (0..data_table.row_count-1)
  for j in (0..data_table.column_count-1)
    print (data_table.get_element(i, j))
    print ("     | ")
  end
  puts
end
puts "----------------------------------"

students_list.update_student_by_id(1, st1)
puts students_list.get_student_count


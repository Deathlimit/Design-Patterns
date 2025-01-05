require_relative 'Data_list.rb'
require_relative 'Student.rb'

class Data_list_student < Data_list

  def get_names
    ['N', 'ФИО', 'Git', 'Email', 'Telegram', 'Phone']
  end


  def get_info
    data = @elements.map.with_index(1) do |student, index|
      [
        index,                          
        student.last_name_initials,     
        student.git,  
        student.email,    
        student.telegram, 
        student.phone,                   
      ]
    end
    data
  end
end

require_relative 'Data_list.rb'
require_relative 'Student_short.rb'

class DataListStudentShort < Data_list

  def get_names
    ['N', 'ФИО', 'Git', 'Контакт']
  end


  def get_data
    data = @elements.map.with_index(1) do |student, index|
      [
        index,                          
        student.last_name_initials,     
        student.git,                    
        student.contact               
      ]
    end
    data
  end
end

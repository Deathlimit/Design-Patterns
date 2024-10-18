require_relative 'Student_base.rb'
require_relative 'Student.rb'

class Student_short < Student_base
  attr_reader :last_name_initials

  def initialize(input, id: nil)
    student_to_parse = input
    if input.is_a?(Student)
      student_to_parse = input.get_info
    end
    student_parse = Student_short.parse_info(student_to_parse)
    @last_name_initials = student_parse[:last_name_initials]
    git = student_parse[:git]
    @contact = student_parse[:contact]  
    super(id: id, git: git)
  end

  private

  def self.parse_info(info_string)
    user_parts = info_string.split('|').map(&:strip)
    if user_parts.size == 3
      last_name_initials = user_parts[0] 
      git = user_parts[1].split(':').last.strip 
      if git == "Git"
        git = nil
      end
      contact = user_parts[2].split(':').last.strip 
      if contact == "Контакт"
        contact = nil
      end
      { last_name_initials: last_name_initials, git: git, contact: contact }
    else
      raise ArgumentError, "Неверный формат строки"
    end
  end
end

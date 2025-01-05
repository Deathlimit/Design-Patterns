require_relative 'Student_base.rb'

class Student_short < Student_base

  attr_reader :last_name_initials

  private_class_method :new

  def initialize(last_name_initials, git, contact, id: nil)
    @last_name_initials = last_name_initials
    @contact = contact  
    super(id: id, git: git)
  end


  def self.by_string(student_info, id)
    parse = Student_short.parse_info(student_info)
    new(parse[:last_name_initials], parse[:git], parse[:contact], id: id)
  end
	
  def self.by_student(student)
    if student.is_a?(Student)
	  Student_short.by_string(student.get_info, student.id) 
    end
  end

  def self.bydb(attributes = {})
    last_name_initials = "#{attributes[:last_name]} #{attributes[:first_name][0]}.#{attributes[:patronymic_name][0]}." 
    contact = nil
    if attributes[:email]
      contact = attributes[:email]
    elsif attributes[:phone]
      contact = attributes[:phone]
    elsif attributes[:telegram]
      contact = attributes[:telegram]
    end
    new(last_name_initials, attributes[:git], contact, id: nil)
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
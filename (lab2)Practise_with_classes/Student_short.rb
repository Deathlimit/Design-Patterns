require_relative 'StudentBase.rb'
require_relative 'Student.rb'

class Student_short < StudentBase
  attr_reader :last_name_initials, :git, :contact

  def initialize(*args)
    if args.size == 1 && args[0].is_a?(Student)
      student = args[0]
      @last_name_initials = "#{student.last_name} #{student.first_name[0]}.#{student.patronymic_name[0]}."
      super(student.id, git: student.git, contact: student.get_preferred_contact)
    elsif args.size == 2 && args[0].is_a?(Integer) && args[1].is_a?(String)
      @id = args[0]
      parts = parse_info(info_str)
      @last_name_initials = parts[:last_name_initials]
      git = parts[:git]
      contact = parts[:contact]
      super(id: id, git: git, contact: contact)
    else
      raise ArgumentError, "Неправильные аргументы конструктора"
    end
  end

  private

  def parse_info(info_string)
    user_parts = info_string.split('|').map(&:strip)
    if user_parts.size == 3
      last_name_initials = user_parts[0] 
      git = user_parts[1].split(':').last.strip 
      contact = user_parts[2].split(':').last.strip 
      { last_name_initials: last_name_initials, git: git, contact: contact }
    else
      raise ArgumentError, "Неверный формат строки"
    end
  end
end

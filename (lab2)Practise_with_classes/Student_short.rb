class Student_short
  attr_reader :id, :last_name_initials, :git, :contact

  def initialize(*args)
    if args.size == 1 && args[0].is_a?(Student)
      student = args[0]
      @id = student.id
      @last_name_initials = "#{student.last_name} #{student.first_name[0]}.#{student.patronymic_name[0]}."
      @git = student.git
      @contact = student.get_preferred_contact
    elsif args.size == 2 && args[0].is_a?(Integer) && args[1].is_a?(String)
      @id = args[0]
      parse_info(args[1])
    else
      raise ArgumentError, "Неправильные аргументы конструктора"
    end
  end

  private

  def parse_info(info_string)
    user_parts = info_string.split('|').map(&:strip)
    if user_parts.size == 3
      @last_name_initials = user_parts[0] 
      @git = user_parts[1].split(':').last.strip 
      @contact = user_parts[2].split(':').last.strip 
    else
      raise ArgumentError, "Неверный формат строки"
    end
  end
end

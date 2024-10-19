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

	
  def self.by_student(student)
    if student.is_a?(Student)
	  StudentShort.byString(student.get_info) 


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
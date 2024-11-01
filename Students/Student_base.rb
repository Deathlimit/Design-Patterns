
class Student_base
    attr_reader :id, :git
  
    def initialize(id: nil, git: nil)
      self.id = id
      self.git = git
    end
  
    def contact
      if @contact
        return @contact
      elsif @phone
        return "Телефон: #{@phone}"
      elsif @telegram
        return "Telegram: #{@telegram}"
      elsif @email
        return "Email: #{@email}"
      else
        return nil
      end
    end

    def validate
      unless self.has_git?
        return false
      end
      unless self.has_contact?
        return false
      end
      return true
    end

    def id=(id)
      if id.nil? || id.is_a?(Integer)
        @id = id
      else
        raise ArgumentError, "ID должен быть числом"
      end
    end

    def git=(git)
      if git.nil? || Student.git_regex_valid?(git)
        @git = git
      else 
        raise ArgumentError, "Некорректный формат Git: #{git}"
      end
    end
  
    def has_git?
      !@git.nil? 
    end

    def has_contact?
      !self.contact.nil?
    end 
  end

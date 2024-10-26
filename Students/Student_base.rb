
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
      unless Student_base.has_git?(@git)
        return false
      end
      unless Student_base.has_contact?(self.contact)
        return false
      end
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
  
    def self.has_git?(git)
      !git.nil? 
    end
  
    def self.has_contact?(con)
      !con.nil?
    end 
  end

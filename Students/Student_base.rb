
class Student_base
    attr_reader :id, :git
  
    def initialize(id: nil, git: nil)
      @id = id
      @git = git
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
        raise ArgumentError, "ID: #{id} Git-репозиторий не указан."
      end
      unless Student_base.has_contact?(self.contact)
        raise ArgumentError, "ID: #{id} Не указан ни один контакт."
      end
    end
  
    def self.has_git?(git)
      !git.nil? 
    end
  
    def self.has_contact?(con)
      !con.nil?
    end 
  end

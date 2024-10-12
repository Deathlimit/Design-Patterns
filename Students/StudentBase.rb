class StudentBase
    attr_reader :id, :git
  
    def initialize(id: nil, git: nil)
      @id = id
      @git = git
    end
  
    def validate
      unless StudentBase.has_git?(@git)
        raise ArgumentError, "ID: #{id} Git-репозиторий не указан."
      end
      unless StudentBase.has_contact?()
        raise ArgumentError, "ID: #{id} Не указан ни один контакт."
      end
    end
  
    def self.has_git?(git)
      !git.nil? 
    end
  
    def self.has_contact?(contact)
      !@phone.nil? || !@telegram.nil? || !@phone.nil? || !@contact.nil?
    end
    
  end

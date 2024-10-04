class StudentBase
    attr_reader :id, :git, :contact
  
    def initialize(id, git: nil, contact: nil)
      @id = id
      @git = git
      @contact = contact
    end
  
    def validate
      unless StudentBase.git_valid?(@git)
        raise ArgumentError, "ID: #{id} Git-репозиторий не указан."
      end
      unless StudentBase.contact_valid?(@contact)
        raise ArgumentError, "ID: #{id} Не указан ни один контакт."
      end
    end
  
    def self.git_valid?(git)
      !git.nil? && git.match?(/^[a-zA-Z][a-zA-Z0-9-]{0,38}$/)
    end
  
    def self.contact_valid?(contact)
      !contact.nil?
    end
    
  end
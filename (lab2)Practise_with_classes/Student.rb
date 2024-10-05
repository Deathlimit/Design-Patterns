require_relative 'StudentBase.rb'

class Student < StudentBase
  attr_reader :last_name, :first_name, :patronymic_name, :phone, :telegram, :email
  
  
  def initialize(last_name, first_name, patronymic_name, id, phone: nil, telegram: nil, email: nil, git: nil)
    self.last_name = last_name
    self.first_name = first_name
    self.patronymic_name = patronymic_name
    self.id = id
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
    contact = get_preferred_contact 
    super(id: id, git: git, contact: contact)
  end

  def set_contacts(phone: nil, telegram: nil, email: nil, git: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
    self.git = git if git
  end


  
  def to_s
    "ID: #{@id},
    Фамилия: #{@last_name},
    Имя: #{@first_name},
    Отчество: #{@patronymic_name}, 
    Телефон: #{@phone || 'не указан'},
    Телеграм: #{@telegram || 'не указан'}, 
    Почта: #{@email || 'не указана'},
    Гит: #{@git || 'не указан'}"
  end

  def get_info
    "#{get_last_name} #{get_initials} | Git: #{get_git} | Контакт: #{get_preferred_contact}"
  end

  def get_git
    @git
  end
  
  def get_last_name
    @last_name
  end
  
  def get_initials
    "#{@first_name[0]}.#{@patronymic_name[0]}."
  end

  def get_preferred_contact
    if @phone
      return "Телефон: #{@phone}"
    elsif @telegram
      return "Telegram: #{@telegram}"
    elsif @email
      return "Email: #{@email}"
    else
      return nil
    end
  end



  def last_name=(last_name)
    if Student.name_regex_valid?(last_name)
      @last_name = last_name
    else
      raise ArgumentError, "Фамилия должна содержать только буквы"
    end
  end

  def first_name=(first_name)
    if  Student.name_regex_valid?(first_name)
      @first_name = first_name
    else
      raise ArgumentError, "Имя должно содержать только буквы"
    end
  end

  def patronymic_name=(patronymic_name)
    if  Student.name_regex_valid?(patronymic_name)
      @patronymic_name = patronymic_name
    else
      raise ArgumentError, "Отчество должно содержать только буквы"
    end
  end

  def id=(id)
    if id.is_a?(Integer)
      @id = id
    else
      raise ArgumentError, "ID должен быть числом"
    end
  end

  def self.telegram_regex_valid?(telegram)
  telegram.match?(/\A@[\w\d_]+\z/)
  end
      
  def self.email_regex_valid?(email)
  email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end
      
  def self.git_regex_valid?(git)
  git.match?(/^[a-zA-Z][a-zA-Z0-9-]{0,38}$/)
  end
      
  def self.phone_regex_valid?(phone)
  phone.match?(/^\+?[1-9][0-9]{7,14}$/)
  end
  
  def self.name_regex_valid?(name)
  name.match?(/\A[А-Яа-яЁёA-Za-z]+\z/)
  end
  
  def self.contact_valid?(phone, telegram, email)
    !phone.nil? || !telegram.nil? || !email.nil?
  end

  private

  def telegram=(telegram)
    if telegram.nil? || Student.telegram_regex_valid?(telegram)
      @telegram = telegram
    else
      raise ArgumentError, "Некорректный формат Telegram: #{telegram}"
    end
  end

  def email=(email)
    if email.nil? || Student.email_regex_valid?(email)
      @email = email
    else
      raise ArgumentError, "Некорректный формат email: #{email}"
    end
  end

  def phone=(phone)
    if phone.nil? || Student.phone_regex_valid?(phone)
      @phone = phone
    else
      raise ArgumentError, "Некорректный формат телефонного номера: #{phone}"
    end
  end

  def git=(git)
    if git.nil? || Student.git_regex_valid?(git)
      @git = git
    else 
      raise ArgumentError, "Некорректный формат Git: #{git}"
    end
  end







  

end

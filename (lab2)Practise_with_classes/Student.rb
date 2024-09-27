class Student
  attr_accessor :last_name, :first_name, :patronymic_name, :id
  
  
  def initialize(last_name, first_name, patronymic_name, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    self.last_name = last_name
    self.first_name = first_name
    self.patronymic_name = patronymic_name
    self.id = id
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git

    validate(git, phone, telegram, email)
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


  def last_name=(last_name)
    if name_regex_valid?(last_name)
      @last_name = last_name
    else
      raise ArgumentError, "Фамилия должна содержать только буквы"
    end
  end

  def first_name=(first_name)
    if name_regex_valid?(first_name)
      @first_name = first_name
    else
      raise ArgumentError, "Имя должно содержать только буквы"
    end
  end

  def patronymic_name=(patronymic_name)
    if name_regex_valid?(patronymic_name)
      @patronymic_name = patronymic_name
    else
      raise ArgumentError, "Отчество должно содержать только буквы"
    end
  end

  def name_regex_valid?(name)
    name.match?(/\A[А-Яа-яЁёA-Za-z]+\z/)
  end

  def id=(id)
    if id.is_a?(Integer)
      @id = id
    else
      raise ArgumentError, "ID должен быть числом"
    end
  end


  private
  attr_writer :phone, :telegram, :email, :git


  def telegram=(telegram)
    if telegram.nil? || telegram.match?(/\A@[\w\d_]+\z/)
      @telegram = telegram
    else
      raise ArgumentError, "Некорректный формат Telegram: #{telegram}"
    end
  end

  def email=(email)
    if email.nil? || email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
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
    if git.match?(/^[a-zA-Z][a-zA-Z0-9-]{0,38}$/)
      @git = git
    else 
      raise ArgumentError, "Некорректный формат Git: #{git}"
    end
  end
    
  def self.phone_regex_valid?(phone)
    phone.match?(/^\+?[1-9][0-9]{7,14}$/)
  end

  def git_valid?(git)
    !git.nil?
  end


  def contact_valid?(phone, telegram, email)
    !phone.nil? || !telegram.nil? || !email.nil?
  end


  def validate(git, phone, telegram, email)
    unless git_valid?(git)
      raise ArgumentError, "ID: #{id} Git-репозиторий должен быть указан."
    end

    unless contact_valid?(phone, telegram, email)
      raise ArgumentError, "ID: #{id} Должен быть указан хотя бы один контакт (телефон, телеграм или email)."
    end
  end
  

end

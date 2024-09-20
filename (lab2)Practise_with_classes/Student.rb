class Student
  attr_accessor :last_name, :first_name, :patronymic_name, :id, :phone, :telegram, :email, :git
  
  def initialize(last_name, first_name, patronymic_name, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @last_name = last_name
    @first_name = first_name
    @patronymic_name = patronymic_name
    @id = id
    self.phone = phone
    @telegram = telegram
    @email = email
    @git = git
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

  def phone=(phone)
    if phone.nil? || Student.phone_regex_valid?(phone)
      @phone = phone
    else
      raise ArgumentError, "Некорректный формат телефонного номера: #{phone}"
    end
  end

  def self.phone_regex_valid?(phone)
    phone.match?(/^\+?[1-9][0-9]{7,14}$/)
  end
  
end

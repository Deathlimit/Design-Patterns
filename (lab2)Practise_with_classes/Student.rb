class Student
  attr_accessor :last_name, :first_name, :patronymic_name, :id, :phone, :telegram, :email, :git
  
  def initialize(last_name, first_name, patronymic_name, id: nil, phone: nil, telegram: nil, email: nil, git: nil)
    @last_name = last_name
    @first_name = first_name
    @patronymic_name = patronymic_name
    @id = id
    @phone = phone
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
end

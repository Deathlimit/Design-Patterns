require_relative 'Student_base.rb'
require 'date'

class Student < Student_base
  include Comparable

  attr_reader :last_name, :first_name, :patronymic_name, :phone, :telegram, :email, :birth_date
  
  
  def initialize(attributes = {})
    self.last_name = attributes[:last_name] 
    self.first_name = attributes[:first_name] 
    self.patronymic_name = attributes[:patronymic_name]
    self.birth_date = attributes[:birth_date]
    set_contacts(phone: attributes[:phone], telegram: attributes[:telegram], email: attributes[:email]) 
    super(id: attributes[:id], git: attributes[:git])
  end

  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
  end
  
  def to_s
    "ID: #{@id},
    Фамилия: #{@last_name},
    Имя: #{@first_name},
    Отчество: #{@patronymic_name}, 
    Телефон: #{@phone || 'не указан'},
    Телеграм: #{@telegram || 'не указан'}, 
    Почта: #{@email || 'не указана'},
    Гит: #{@git || 'не указан'},
    Дата рождения: #{@birth_date || 'не указан'}"
  end

  def to_hash
    { 
    id: self.id, 
    first_name: self.first_name, 
    last_name: self.last_name, 
    patronymic_name: self.patronymic_name, 
    birth_date: self.birth_date, 
    telegram: self.telegram,
    email: self.email, 
    phone: self.phone, 
    git: self.git 
    }
end

  def get_info
    "#{@last_name} #{get_initials} | Git: #{@git} | Контакт: #{contact}"
  end
  
  def get_initials
    "#{@first_name[0]}.#{@patronymic_name[0]}."
  end

  def last_name_initials
    "#{@last_name} #{@first_name[0]}.#{@patronymic_name[0]}."
  end

  def last_name=(last_name)
    if Student.name_regex_valid?(last_name)
      @last_name = last_name
    else
      raise ArgumentError, "Фамилия должна содержать только буквы"
    end
  end
   
  def get_full_name
    "#{last_name} #{get_initials}"
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

  def birth_date=(birth_date)
    if birth_date.nil? || Student.valid_date?(birth_date)
      @birth_date = birth_date
    else
      raise ArgumentError, "Некорректная дата рождения: #{birth_date}"
    end
  end

  def <=>(student)
    self.birth_date <=> student.birth_date
  end

  def self.valid_date?(date)
    Date.parse(date) rescue false
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

end

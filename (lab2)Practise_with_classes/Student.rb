class Student
  def initialize(last_name, first_name, patronymic_name, id = nil, phone = nil, telegram = nil, email = nil, git = nil)
    @last_name = last_name
    @first_name = first_name
    @patronymic_name = patronymic_name
    @id = id
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
  end

  def get_last_name
    @last_name
  end

  def set_last_name(last_name)
    @last_name = last_name
  end

  def get_first_name
    @first_name
  end

  def set_first_name(first_name)
    @first_name = first_name
  end

  def get_patronymic_name
    @middle_name
  end

  def set_patronymic_name(patronymic_name)
    @patronymic_name = patronymic_name
  end

  def get_id
    @id
  end

  def set_id(id)
    @id = id
  end

  def get_phone
    @phone
  end

  def set_phone(phone)
    @phone = phone
  end

  def get_telegram
    @telegram
  end

  def set_telegram(telegram)
    @telegram = telegram
  end

  def get_email
    @email
  end

  def set_email(email)
    @email = email
  end

  def get_git
    @git
  end

  def set_git(git)
    @git = git
  end
end

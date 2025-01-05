require_relative 'Student.rb'
require_relative 'Student_short.rb'
require_relative 'data_list_student_short.rb'
require_relative 'DB_Client.rb'


class Students_List_DB

  def get_student_by_id(id)
    query = 'SELECT * FROM students WHERE id = ?'
    student_data = DB_Client.instance.query(query, [id]).first
    return nil unless student_data

    Student.new(student_data.transform_keys(&:to_sym))
  end



  def get_k_n_student_short_list(k, n)
    start = (k - 1) * n
    query = 'SELECT * FROM students LIMIT ? OFFSET ?'
    students_data = DB_Client.instance.query(query, [n, start])
    students_short = students_data.map { |student| Student_short.bydb(student.transform_keys(&:to_sym)) }
    Data_list_student_short.new(students_short)
  end



  def add_student(student)
    query = <<~SQL
      INSERT INTO students (last_name, first_name, patronymic_name, birth_date, phone, git, telegram, email)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    SQL
    id = DB_Client.instance.query(query, [
      student.last_name, student.first_name, student.patronymic_name,
      student.birth_date, student.phone, student.git, student.telegram, student.email
    ])
    student.id = DB_Client.instance.query('SELECT last_insert_rowid()').first[:last_insert_rowid]
  end



  def update_student_by_id(id, student)
    query = <<~SQL
      UPDATE students
      SET last_name = ?, first_name = ?, patronymic_name = ?, birth_date = ?,
          phone = ?, git = ?, telegram = ?, email = ?
      WHERE id = ?
    SQL
    DB_Client.instance.query(query, [
      student.last_name, student.first_name, student.patronymic_name,
      student.birth_date, student.phone, student.git, student.telegram, student.email, id
    ])
  end



  def delete_student_by_id(id)
    query = 'DELETE FROM students WHERE id = ?'
    DB_Client.instance.query(query, [id])
  end


  
  def get_student_count
    query = 'SELECT COUNT(*) AS count FROM students'
    DB_Client.instance.query(query).first['count']
  end
end
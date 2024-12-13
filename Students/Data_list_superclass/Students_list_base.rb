require 'json'
require 'yaml'
require_relative 'Student.rb'
require_relative 'student_short.rb'
require_relative 'data_list_student_short.rb'




class Students_list_base
    def initialize(file_path, strategy)
        @file_path = file_path
        @strategy = strategy
        @students = read_from_file
        
    end
  
    def read_from_file
        @students = @strategy.read(@file_path).map { |data| Student.new(**data) }
    end
  
    def write_to_file
        @strategy.write(@file_path, @students.map(&:to_hash))
    end
  
    def get_student_by_id(id)
      @students.find { |student| student.id == id }
    end
  
    def get_k_n_student_short_list(k, n, data_list = nil)
        start = (k - 1) * n
        students_short = @students[start, n].map { |student| Student_short.by_student(student) }
        data_list ||= Data_list_student_short.new(students_short)
        data_list
    end

    def sort_by_full_name!
        @students.sort_by! { |student| student.get_full_name }
    end
  
    def add_student(student)
        max_id = @students.map(&:id).max || 0
        student.id = max_id + 1
        @students << student
    end
  
    def update_student(id, updated_student)
        index = @students.find_index { |student| student.id == id }
        raise IndexError, 'Студент с таким id не найден' unless index
        updated_student.id = id
        @students[index] = updated_student
    end
  
    def delete_student(id)
      @students.reject! { |student| student.id == id }
      write_to_file
    end

    def get_student_short_count
        @students.size
    end

    private
    attr_accessor :file_path, :students
  end
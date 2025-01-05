
require_relative 'Students_list_base.rb'
require_relative 'Data_list.rb'
require_relative 'file_json.rb'

class Student_list_controller

def initialize(view)
    self.view = view
    self.student_list = Students_list_base.new('students.json', JSON_strategy)
    self.data_list = Data_list.new([])
    self.data_list.add_observer(self.view)
end


def add_student

end

def refresh_data

end


def delete_student

end


def update_student

end


private
attr_accessor :view, :student_list, :data_list

end
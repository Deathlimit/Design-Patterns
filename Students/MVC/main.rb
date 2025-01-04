require 'fox16'
require_relative 'student_list_view.rb'

include Fox

application = FXApp.new
main_window = FXMainWindow.new(application, "Students App", nil, nil, DECOR_ALL, 0, 0, 800, 600)
Student_list_view.new(main_window)
application.create
main_window.show(PLACEMENT_SCREEN)
  
application.run
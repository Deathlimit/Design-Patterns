require './deep_dup.rb'
require_relative 'Data_table.rb'

class Data_list
  attr_accessor :elements, :selected_ids, :count, :observers

  include Deep_dup
    def initialize(elements)
      unless elements.is_a?(Array)
        raise ArgumentError, 'Данные должны быть массивом'
      end
      self.elements = elements
      self.selected_ids = []
      self.observers = []
    end
  

    def select(number)
      validate_index(number)
      id = self.elements[number].id 
      self.selected_ids << id unless self.selected_ids.include?(id)
    end
  

    def get_selected
      self.deep_dup(self.selected_ids)
    end
    
    def get_names
      raise NotImplementedError, 'Метод get_names должен быть реализован в наследниках'
    end
  

    def get_data
      datatable=[]
      datatable << self.get_names
      datatable.concat(self.get_info)
      Data_table.new(datatable)
    end
    
    def get_info
      raise NotImplementedError, 'Метод get_info должен быть реализован в наследниках'
    end

    def add_observer(observer)
      self.observers << observer
    end


    def notify(data)
      self.observers.each do |observer|
        observer.set_table_params(data.get_names, self.count)
        observer.set_table_data(data.get_data)
      end
    end

  
    private

    def validate_index(index)
      unless index.between?(0, self.elements.size - 1)
        raise IndexError, 'Индекс вне диапазона'
      end
    end
  end
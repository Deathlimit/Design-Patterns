class Data_list
    def initialize(elements)
      unless elements.is_a?(Array)
        raise ArgumentError, 'Данные должны быть массивом'
      end
      @elements = elements.dup
      @selected_ids = []
    end
  

    def select(number)
      validate_index(number)
      id = @elements[number].id 
      @selected_ids << id unless @selected_ids.include?(id)
    end
  

    def get_selected
      @selected_ids.dup
    end

    def get_names
      raise NotImplementedError, 'Метод get_names должен быть реализован в наследниках'
    end
  

    def get_data
      raise NotImplementedError, 'Метод get_data должен быть реализован в наследниках'
    end
  
    private

    def validate_index(index)
      unless index.between?(0, @elements.size - 1)
        raise IndexError, 'Индекс вне диапазона'
      end
    end
  end
  
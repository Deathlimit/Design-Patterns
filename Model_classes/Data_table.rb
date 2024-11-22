class DataTable

  def initialize(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, 'Данные должны быть двумерным массивом'
    end
    @data = data.dup
  end

def get_element(row_index, col_index)
  @data[row_index][col_index]
end

def row_count
  @data.size
end

def column_count
  @data.first.size
end

end


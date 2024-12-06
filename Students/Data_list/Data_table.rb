require './deep_dup.rb'

class DataTable
  include Deep_dup

  def initialize(data)
    unless data.is_a?(Array) && data.all? { |row| row.is_a?(Array) }
      raise ArgumentError, 'Данные должны быть двумерным массивом'
    end
    @data = data
  end

def get_element(row_index, col_index)
  raise ArgumentError, 'Индекс вне диапазона' unless valid_index?(row_index, col_index)
  self.deep_dup(@data[row_index][col_index])
end

def row_count
  @data.size
end

def column_count
  @data.first.size
end

private 

def data=(data)
  unless data.is_a?(Array) && data.all? {|row| row.is_a?(Array)}
      raise ArgumentError, "Данные должны быть массивом"
  end

  @data = data.map{ |row| row.map { |element| deep_dup(element) }}
end

def valid_index?(row_index, col_index)
  row_index >= 0 && row_index < @data.size && col_index >= 0 && col_index < @data[row_index].size
end

end


class My_array
    def initialize(array)
      @array = array.dup.freeze
    end
  
    def all?(&block)
      @array.each do |element|
        if !block.call(element)
            return false
        end
      end
      return true
    end
  
    def flat_map(&block)
      result = []
      @array.each do |element|
        result.concat(block.call(element))
      end
      return result
    end
  
    def one?(&block)
      is_found_one = false
      @array.each do |element|
        if block.call(element)
            if is_found_one
                return false 
            end
            is_found_one = true
        end
      end
      return is_found_one
    end
  
    def find(&block)
        @array.each do |element|
            if block.call(element)
                return element 
            end
        end
    return nil
  end

  def min_by(&block)
    min_element = @array.first
    @array.each do |element|
      if block.call(element) < block.call(min_element)
        min_element = element 
      end
    end
    return min_element
  end

  def inject(initial = 0, &block)
    accumulator = initial
    @array.each do |element|
        accumulator = block.call(accumulator, element)
    end
    return accumulator
  end

end
require 'minitest/autorun'

class My_array_test < Minitest::Test
  def setup
    array = [1, 2, 3]
    @test_array = My_array.new(array)
  end

  def test_all
    assert_equal true, @test_array.all? { |x| x > 0 }
    assert_equal false, @test_array.all? { |x| x < 3 }
  end

  def test_flat_map
    assert_equal [1, 2, 2, 4, 3, 6], @test_array.flat_map { |x| [x, x * 2] }
  end

  def test_one
    assert_equal true, @test_array.one? { |x| x == 3 }
    assert_equal false, @test_array.one? { |x| x > 3 }
  end

  def test_find
    assert_equal 3, @test_array.find { |x| x == 3 }
    assert_nil @test_array.find { |x| x == 4 }
  end

  def test_min_by
    assert_equal 1, @test_array.min_by { |x| x }
    assert_equal 3, @test_array.min_by { |x| -x }
  end

  def test_inject
    assert_equal 6, @test_array.inject { |sum, x| sum + x }
    assert_equal 11, @test_array.inject(5) { |sum, x| sum + x }
  end
end
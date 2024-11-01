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
end
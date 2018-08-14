require 'byebug'

class WalkingNumbers

  def self.process(input_matrix)
    result_matrix = initalize_result input_matrix
    origin_number = input_matrix[0][0]

    byebug

    @old_result_count, @new_result_count = -1, 0

    while @old_result_count < @new_result_count do
      temp_result_matrix = result_matrix.map.with_index { |row, y| row.map.with_index { |item, x| detect( x, y, input_matrix, result_matrix, origin_number ) ? 1 : 0 } }

      @old_result_count = result_matrix.flatten.count { |item| item == 1 }
      result_matrix = merge_matrices result_matrix, temp_result_matrix
      @new_result_count = result_matrix.flatten.count { |item| item == 1 }
    end

    result_matrix
  end

  def self.initalize_result input_matrix
    result = input_matrix.map { |y| y.map { |x| 0 } }
    result[0][0] = 1
    result
  end

  def self.merge_matrices source, additional
    source.map.with_index { |row, y| row.map.with_index { |item, x| (item == 1 or additional[y][x] == 1) ? 1 : 0 } }
  end

  def self.detect x, y, input_matrix, result_matrix, origin_number
    puts "x: #{x}, y: #{y}"
    byebug if origin_number == 7
   
    if input_matrix[y][x] == origin_number
      if x - 1 >= 0 && result_matrix[y][x-1] == 1
        true
      elsif x + 1 < input_matrix[y].length && result_matrix[y][x + 1] == 1
        true
      elsif y - 1 >= 0 && result_matrix[y-1][x] == 1
        true
      elsif y + 1 < input_matrix.length && result_matrix[y+1][x] == 1
        true
      else
        false
      end        
    else
      false
    end
  end

end
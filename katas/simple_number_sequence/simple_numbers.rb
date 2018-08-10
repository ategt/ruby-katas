require 'byebug'

class SimpleNumbers

  def self.missing(input, expected=nil)
    test_string = "-#{input.dup}"
    result = boundry_integers(input)

    if result

      starting_number, ending_number = result

      missing_number_strings = 
          (starting_number..ending_number).
                                      to_a.
                                      map(&:to_s).
                                      select { |number| !test_string.sub!("-#{number}", '-') }

      byebug if expected and !missing_number_strings.one? || missing_number_strings.last.to_i != expected.first

      if missing_number_strings.one?
        missing_number_strings.last.to_i
      else
        -1
      end                                      
    else
      -1
    end
  end

  def self.boundry_integers(input_string, most_digits_to_consider = 8)
    (1..most_digits_to_consider).
          map { |test_digit_count| boundry_integers_by_digits(input_string, test_digit_count) } .
          select { |nillable_result| !!nillable_result } .
          last
  end

  private

    def self.boundry_integers_by_digits(input_string, digits)
      total_numbers = input_string.length / digits

      first_test_digit = input_string[0, digits].to_i
      last_test_digit = input_string[-digits, digits].to_i
      other_possible_last_test_digit = input_string[-digits-1, digits+1].to_i

      a_number_beyond_the_range = first_test_digit + total_numbers + 2

      if first_test_digit < last_test_digit and last_test_digit < a_number_beyond_the_range
        [first_test_digit, last_test_digit]
      elsif first_test_digit < other_possible_last_test_digit and other_possible_last_test_digit < a_number_beyond_the_range
        [first_test_digit, other_possible_last_test_digit]
      else
        nil
      end
    end

end 
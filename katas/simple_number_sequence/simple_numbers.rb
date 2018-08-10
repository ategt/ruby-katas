class SimpleNumbers

  def self.missing(input)



  end

  def self.boundry_integers(input_string, digits)
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
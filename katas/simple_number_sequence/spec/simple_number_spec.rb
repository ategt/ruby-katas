require_relative '../simple_numbers'

describe SimpleNumbers do 
   context "has a missing function," do 
      
      it "should take a string of single digit numbers and return the missing number" do  
        result = SimpleNumbers.missing("123567")
        expect(result).to eq 4
      end
      
      it "should take a string of two digit numbers and return the missing number" do  
        result = SimpleNumbers.missing("899091939495")
        expect(result).to eq 92
      end
      
      it "should take a string of numbers and return the missing number even if the number of digits change" do  
        result = SimpleNumbers.missing("9899101102")
        expect(result).to eq 100
      end
      
      it "should take a string of numbers and return -1 if no number is missing" do
        result = SimpleNumbers.missing("599600601602")
        expect(result).to eq -1
      end
      
      it "should take a string of numbers and return the missing number or -1 if more than one number is missing" do
        result = SimpleNumbers.missing("8990919395")  # Both 92 and 94 missing.
        expect(result).to eq -1
      end
      
      it "should take a string of numbers between 1 and 9 with one missing number and return the missing number" do
        number_sequence = (1..9).
                                to_a.
                                tap {|numbers_array| @removed_number = numbers_array.delete_at(1 + rand(numbers_array.length - 2 )) } .
                                map {|integer| integer.to_s } .
                                join

        result = SimpleNumbers.missing(number_sequence)
        expect(result).to eq @removed_number
      end
      
      it "should take a randomly created string of numbers and return the missing number" do
        starting_int = rand(100_005)
        ending_int = starting_int + rand(50) + 1



        result = SimpleNumbers.missing()
        expect(result).to eq -1
      end
      
   end

  context "has a function for extracting boundry integers from a string of numbers, and" do

    it "should return 1 and 6" do

      first_result, second_result = SimpleNumbers.boundry_integers("123456", 1)
      expect(first_result).to eq 1
      expect(second_result).to eq 6

    end

    it "should return 5 and 12" do

      first_result, second_result = SimpleNumbers.boundry_integers("56789101112", 1)
      expect(first_result).to eq 5
      expect(second_result).to eq 12

    end

    it "should return nil" do

      result = SimpleNumbers.boundry_integers("575382", 1)
      expect(result).to be_nil

    end

  end

  # bundle exec rspec spec/simple_number_spec.rb
  # missing("123567") = 4 
  # missing("899091939495") = 92
  # missing("9899101102") = 100
  # missing("599600601602") = -1 -- no number missing
  # missing("8990919395") = -1 -- error in sequence. Both 92 and 94 missing.
end
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
      
      it "should return 77782, but it was returning -1" do
        result = SimpleNumbers.missing("77778777797778077781777837778477785777867778777788")
        expect(result).to eq 77782
      end
      
      it "should return 1091, but it was returning -1" do
        result = SimpleNumbers.missing("108410851086108710881089109010921093109410951096109710981099110011011102110311041105110611071108110911101111111211131114111511161117111811191120")
        expect(result).to eq 1091
      end
      
      it "should return 9973, but was returning -1." do

        input = (9969..10_000).to_a.map(&:to_s).join.sub '9973',''
        result = SimpleNumbers.missing(input)
        expect(result).to eq 9973

      end

      it "should take a string of numbers between 1 and 9 with one missing number and return the missing number" do
        number_sequence = (1..9).
                                to_a.
                                tap {|numbers_array| @removed_number = numbers_array.delete_at(1 + rand(numbers_array.length - 2 )) } .
                                map(&:to_s).
                                join

        result = SimpleNumbers.missing(number_sequence)
        expect(result).to eq @removed_number
      end
      
      it "should take a randomly created string of numbers and return the missing number" do
        1_000_000.times do
          starting_int = rand(100_005)
          ending_int = starting_int + rand(50) + 3

          number_sequence = (starting_int..ending_int).
                                  to_a.
                                  tap {|numbers_array| @removed_number = numbers_array.delete_at(1 + rand(numbers_array.length - 2 )) } .
                                  map(&:to_s).
                                  join

          result = SimpleNumbers.missing(number_sequence, [@removed_number, starting_int, ending_int])
          expect(result).to eq(@removed_number), "expected #{@removed_number}, got #{result}, using range from #{starting_int} to #{ending_int}"
        end
      end
      
      it "should take a randomly created string of numbers and return -1 because no numbers are missing" do
        1_000_000.times do
          starting_int = rand(100_005)
          ending_int = starting_int + rand(50) + 2

          number_sequence = (starting_int..ending_int).
                                  to_a.
                                  map(&:to_s).
                                  join

          result = SimpleNumbers.missing(number_sequence)
          expect(result).to eq(-1), "expected -1, got #{result}, using range from #{starting_int} to #{ending_int}"
        end
      end
      
   end

  context "has a function for extracting boundry integers from a string of numbers, and" do

    it "should return 1 and 6" do

      first_result, second_result = SimpleNumbers.boundry_integers("123456")
      expect(first_result).to eq 1
      expect(second_result).to eq 6

    end

    it "should return 5 and 12" do

      first_result, second_result = SimpleNumbers.boundry_integers("56789101112")
      expect(first_result).to eq 5
      expect(second_result).to eq 12

    end

    it "should return nil" do

      result = SimpleNumbers.boundry_integers("575382")
      expect(result).to be_nil

    end

    it "should handle large numbers" do

      first_result, second_result = SimpleNumbers.boundry_integers("10000100011000210003100041000510006")
      expect(first_result).to eq 10000
      expect(second_result).to eq 10006

    end

    it "should return 446 - 495, it was having issues, though." do

      input = (446..495).to_a.map(&:to_s).join
      first_result, second_result = SimpleNumbers.boundry_integers(input)
      expect(first_result).to eq 446
      expect(second_result).to eq 495

    end

    it "should return 88 - 110, it was having issues, though." do

      input = (88..110).to_a.map(&:to_s).join.sub '107',''
      first_result, second_result = SimpleNumbers.boundry_integers(input)
      expect(first_result).to eq 88
      expect(second_result).to eq 110

    end

    it "should return 77778 - 77788, it was having issues, though." do

      input = (77778..77788).to_a.map(&:to_s).join.sub '77782',''
      first_result, second_result = SimpleNumbers.boundry_integers(input)
      expect(first_result).to eq 77778
      expect(second_result).to eq 77788

    end

  end

  # bundle exec rspec spec/simple_number_spec.rb
  # missing("123567") = 4 
  # missing("899091939495") = 92
  # missing("9899101102") = 100
  # missing("599600601602") = -1 -- no number missing
  # missing("8990919395") = -1 -- error in sequence. Both 92 and 94 missing.
end